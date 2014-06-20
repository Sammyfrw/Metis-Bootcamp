

skip_before_action :require_login, only: [:new, :create]

# When we use monban generator, we add new lines to user and session files;
# skip_before_action is added to the controller files. Basically, everything
# we did yesterday, Monban did it for us.

gem 'monban-generators'

# Should be put in the gemfile.

# Database indexes are essentially bookmarks; by writing a bit more we are
# able to label or find entries in a database much faster without having to
# read the entire database. It allows the database to scan much fewer rows.

# We have validation in the form of unique indexes in the database to act as
# the final say whether or not there is a unique name at a database level.
# While we can include validation in ActiveRecord like we have been, it is
# still possible 2 users can sign up at the same time into the ActiveRecord
# and be told that they are good, until the records are put into the database.

gem 'rails_12factor', group: :production

# Heroku is an online hosting server that allows people to host projects in
# the cloud. This gem gives us various actions and activities relating to
# heroku philosophy, based on the parameters we give.

# git checkout -f removes the last thing you've added.
And #git close erkee


rails generate migration add_user_id_to_galleries user_id: integer 

# This adds a new user ID foreign key to the gallery, courtesy of heroku_12factor.



