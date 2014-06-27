# We need join tables which are made up of foreign keys if we want to make
# groups for users. Basically, a join table will contain the foreign key for
# the user members and the foreign key of the group ID they are in.

<%=form.label "Groups"%>>
<%= form.collection_check_boxes :group_ids, @groups, :id, :name% >>

# :Group Ids here is telling HTML to render group_id in the controller for
# :group_ids. @groups is the collection to iterate over; so we'll have a
# :checkbox for all that the iteration's printed out. The :id is assigning the
# :ID numbers for each checkbox with an associated :name.  

# If we pass all the group ids of a checkbox to the images, but we'll hae to
# specify in the hard params that group_id's will come as a hash. 

# Update, create and new can take hashes as params. It basically calls the
# method .group_ids (that we gain from the has_many) but following that, rails
# will use rails magic to allow the proper associations to be made.


# When we use a :resource (not :resources) we don't have an ID. When we will
# nest the route, and we don't need an ID, and would like to refer to a parent
# ID, it's best to just use a :resource instead. Additionally, it only
# generates 6 routes, with no index. This is because indexes show a
# collection, but a resource won't have many at once.



# IF we want to delete a membership in a join table, then we have to use our
# index searching to make sure we delete the right one. We will already know
# the group_id via the url, and we can obtain the user ID by using the
# current_user function. But because this is a many to many relationship
# (through a jointable), then commands like current_user.groups will call
# groups through a group membership join table specific to the current user.

group = group.find(params[:group_id])
current_user.groups.destroy(group)

# This will work out, as will the command to create a new membership:

def create
    group = Group.find(params[:group_id])
    current_user.groups << group

    redirect_to :groups
end

# Now, while this is all well and good and even with our validations - but
# most of them were handled by Postgres. The errors are pretty ugly and
# doesn't make sense. So similar to how we had ActiveRecord handle single
# errors in terms of uniqueness and validation, we are able to use
# ActiveRecord's model to target 2 columns at once for validation, using
# scope:

validates :user, uniqueness: {scope: :group}

# Remember that jumble of each group do |group| we used to do? We can have
# rails handle ALL of that.

<% render @groups %>>

<% render @my_groups%>>

# When an object is passed into render, the variable's contents are displayed.
# It renders collections.

