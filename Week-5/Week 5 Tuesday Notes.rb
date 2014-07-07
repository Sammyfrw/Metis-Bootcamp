validate :user_is_not_following_themselves

# We an use this particular validation in FollowingRelationship to make sure
# that users aren't following themselves. validate is a custom validation,
# however, instead of validates. In this case, we must define the method
# ourselves.

# We can add errors to attributes:
def user_is_not_following_themselves
errors.add(:followed_user, "message")
end

# If we're not sure where the error should be, we can use :base instead as a
# catch-all:

errors.add(:base, "Users cannot follow themselves")

# However, with :base errors, it means an error and more will raise the error
# if that attribute is even modified. In that case, we need to make sure we
# write the conditions properly:

def user_is_not_following_themselves
  if follower_id == followed_user_id
    errors.add(:base, "Users cannot follow themselves")
  end
end

# If we want to have a picture, and we have employees that have pictures and a
# product has pictures. We also don't want an employee picture table or
# product picture table, we want all pictures on one table. We can have a one
# to many from 2 sources (products or employees) because a one to many means
# that the images must have a product or an employee, unless null validation
# is voided (which is awful). Enter polymorphic associations. 

# So we can have an imageable_id and imageable_type - which means we can have
# multiple imageable IDs that are the same with what type it is (which can be
# "employee" or "product")

# For the Picture class in this case, we need:
  belongs_to :imageable, polymorphic: true

# And in employee and product:

has_many :pictures, as: :imageable

# So if we were to make shouts that can be either text or images, the shouts
# in this case belongs_to the :subject of the shout - either text or image.
# With polymorphic: :true, we can find where they belong. Text_subject and
# image_subject tables will have many shoutables.

# So to make this work, we need to make shout render the subject - shout will
# either pull out an image or a text subject according to what type the
# subject is.  (shout.subject will call that object).

# Since we've done shouts in the past, we're going to have to fix up the shout
# table and we will need to make new tables.

rails generate migration make_shouts_polymorphic

# And this will be the migration that we'll fix up to make the shouts table
# polymorphic.

class MakeShoutsPolymorphic < ActiveRecord::Migration
  def change
    add_column :shouts :subject_id, :integer
    add_column :shouts, :subject_type, :string
  end
end

# This doesn't have nulls yet because shouts already exist, but they don't have
# new subject ID values (thus, they are null) so the table cannot complete
# migration. For that reason, we either set a default, or allow
# nulls/backfill/disallow nulls to complete the columns.

# Next, we create the next migration:

rails g migration CreateTextSubjects

class CreateTextSubjects < ActiveRecord::Migration
  def change
    create_table :text_subjects do |t|
      t.string :body, null: false
      t.timestamps null: false
    end
  end
end

# and afterward, a third migration to backfill past shouts: titles that don't
# start with Make or Create will mean nothing to Rails.

rails g migration backfill_text_subjects_and_shouts

class BackfillTextSubjectsAndShouts < ActiveRecord::Migration

  class TextSubject < ActiveRecord::Base
  end

  class Shout < ActiveRecord::Base
  end

  def change
    Shout.all.each do |shout|
      text_subject = TextSubject.create(body: shout.body)
      shout.update_attributes(subject: text_subject)

      #or

      #shout.subject_id = text_subject.id
      # shout.subject_type = "TextSubject"
      # shout.save
  end
end

# We need to put the body of every shout, fill it with a text subject and a
# subject ID, and send the body to the TextSubjects table. For this, we
# created a class to exist only within the migration - afterward, it will not
# exist. Its purpose is to act as a model so we can create instances and thus
# allow us to update the respective records in the new TextSubject table. What
# the class does is define the TextSubject model for this migration, and it'll
# take every shout that currently exists and update text_subject with a new
# TextSubject item (with the body record being filled with what is in the
# current Shout instance's body). Then, it will update the shout with new
# attributes to backfill the missing data type within the Shout item with the
# subject of text_subject (which will be called when our new Shouts needs to
# call for it).

# The Shout model already exists if we've followed the creation of Shoutr so
# far, but there's no harm in having that in case someone unfamiliar wants to
# see the code; the Shout class existing for the migration is fine, even if it
# already exists.

# However, this table can be further changed. If you've already migrated, then
# huge changes to the database like this (that isn't a simply migrate of
# making/dropping a table) will require us to specify -what- exactly needs to
# change if we rolled back.

# Instead of def change, we can make it def up and def down. Up is for when we
# migrate, down is for when we rollback.


  def up
    Shout.all.each do |shout|
      text_subject = TextSubject.create(body: shout.body)

      shout.subject_id = text_subject.id
      shout.subject_type = "TextSubject"
      shout.save
    end

    remove_column :shouts, :body

    change_column_null :shouts, :subject_id, false
    change_column_null :shouts, :subject_type, false
  end


  def down
    change_column_null :shouts, :subject_type, true
    change_column_null :shouts, :subject_id, true

    add_column :shouts, :body, :string, null: true

    Shout.all.each do |shout|
      text_subject = TextSubject.find(shout.subject_id)
      shout.update_attributes(body: text_subject.body)
    end

    change_column_null :shouts, :body, false

    execute "UPDATE shouts SET subject_id = NULL, subject_type = NULL"

    execute "DELETE FROM text_subjects"
  end

