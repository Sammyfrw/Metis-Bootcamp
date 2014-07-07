rails new shoutr -T -d postgresql

# This command makes a new database. -T skips tests, -d postgresql sets up the
# database to be postgresql and configs for it immediately. Once you make the
# file, commit it.

# We can check things out into auth directly if our app requires login
# authentication. Afterward, add monban and monban-generators into the
# gemfiles.

# To create a database use:

rake db:create db:migrate

# This will run create and then migrate. This saves time. Then, to change the
# root path you can go to routes.rb and add:

root to: #sessions:new

# Sessions here refers to the sessions controller (hence why it is plural).


# When we go to twitter, we are at a fancy sign up/sign in page. When we sign
# in, we're at the root path BUT we are shown an entirely different page.

# To do this, we can use constraints. Some/most of them are from monban. We'll
# need to require the particular file in monban, and define the constraints.

require "monban/constraints/signed_in"

# and then:

constraints Monban::Constraints::SignedIn.new do
  end

# Thus anything in between do and end will function only when you sign in.
# Remember the route priority, be sure to put the constraints before the root
# defines what the page should be (in this case, sign in)
 
# When we use a before_action in application controller, it can run several
# methods before the rest of the app is run. Among these is the :require_login
# method, which makes it so that you have to login if it is defined:

before_action :require_login

# Then in usercontroller.rb we can override the before_action (when you want
# to show a user page, or create a new user) with skip_before_action. These 2
# are Monban methods.


# To create followers in a relationship between users, we have a many-many
# relationship. However, it's not so straightforward. It's a self-referential
# joint table, because the follower relationship table functions like both a
# table and a join table - this is because users have many followers, who are
# followers. In that sense, the user is joined to another user. As users make
# new follower relationships, and it's a singular resource, it should be
# nested under users.

# You can explicitly name the index names in case it becomes too long. You can
# also explicitly name defined paths as well in the models - it is important
# to do in self-referential joint tables, because it needs to make sure it
# knows which path to take in referring itself.

# We need to define the class names explicitly to ensure it knows which
# direction to take for self-reference. As long as they point the classname to
# the correct model, the names should be fine without the existence of an
# actual joint table entity (which makes sense as the two sides of the join
# table are the same table). The important thing however is that the join
# table model calls belongs_to on both tables as well.

# We can also define specifically what foreign key a model will use for a
# relationship with another table. With the foreign_key: method, we can refer
# to the name of the other tables' foreign key column. When we stray from
# convention like this, Rails can no longer guess for us, so we must define
# many things.


