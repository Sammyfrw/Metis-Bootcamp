# Ruby on Rails - guides and dictates - convention over configuration. It'll
# tell you HOW to run your programs and where, and when.

# Using rails -d (where d = database name) will preconfigure selected
# databases. 

# Using rails -t will skip tests. Won't be using default library for various reasons.


# Initializers - folder of ruby files that are called when application boots.
# Locales - where we put different files for localization (say, spanish, etc.)

# lib is a file that we put in our modules that are not specific to the domain of our app
# log - source of any logs our app spits out while we're running it.
# public - your folder will be exposed to the web if it is in here.
# tmp - temporary files.
# vendor - files modified or inserted from outside sources/automatically via the software.

# .gitignore - tells git what files in this repo that it should ignore. .tmp is by default set to ignore and so the software will never run it.
# gemfile - list of all gems that we'll need to install (and will install automatically) without having to manually install.

# app - where most of our code is going to live. 
  assets - images, external objects/docs. rails will make accessing them easier.
  helpers - 
  mailers -
  controllers -
  models - classes that we use in browser. Represents domain logic within them.
  views - erb, templates that we use.


  # Rails is a model view control framework. It's a way to structure your app
  # code. Provides a way to separate concers.? In Sinatra, we put everything
  # on one file. As our app becomes larger, it becomes hard to maintain.


# Most logic should be stored in our models. Controllers know what we want,
# but do not know how to do it wthout instruction for it on our madels. If we
# wanted to sell something, our controller won't know how to make it even
# though it knows what to do.

Rails.application.routes.draw do
 
 get "/" => "galleries#index"
end

# When our rails begins, we can draw our routes (via config/routes.rb). We can
# get the path as usual like in sinatra, but we must specify the controller
# and the actopm we refer to by using the hash rocket to point the controller
# to our action (in this case, galleries controller and index action)

# And in controllers/galleries_controller.rb  - make if it doesn't exist:

class GalleriesController < ApplicationController

end

# It is important to note that the name of our controller has to be plural in this
# case (Galleries). As also said before we need the action - this is defined
# like a method within the controller (like a class).

def index
  end

# And when we have an action in a rails controller, it will automatically look
# for our template of the same name - our view, our erb file. Thus, we need a
# new view in our views folder, named index.html.erb.

# Before our webpage is loaded, by default we load application.html.erb as a
# layout prior to loading our view (when the layout encounters the 'yield').

In index.html.erb:

<ul>
  <% @galleries.each do |gallery| %>
  <li> <%= gallery.name %></li>
  <%end%>
</ul>

# Akin to our usual erb files, we write this up in our new index.html.erb. If
# we try to run the file now, we'll get an error. Look at the error, and we'll
# see what we need to add. Right now, we need to add a model to figure out what 
# @galleries.each is.

In galleries_controller.rb:

class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end
end

# Seem familiar? Because it is = Gallery is our class, but it is our model. We
# can make our model in our controller folder, but it must be singular.

In controllers/gallery.rb:

class Gallery < ActiveRecord::Base

end

# This'll spring up an error when we load up the page next that we don't have
# a table in relation: galleries. That makes sense, so we'll have to be able
# to add and create tables into our database. We can do this by doing a
# migration into our database:

rails g migration CreateGalleries

# This will create a new file in db/migrate/(timestamped_Create_galleries.rb):

class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
    end
  end
end

# It creates our class for us and migrates the files and includes the methods
# we might need. We do need additional information despite Rails' help at this
# point though. Rails will, however, automatically handle issues like ID via
# migration. Everything else however, is something we will have to mnanage
# ourselves. In this case, we do have to use a domain specific language for
# PSQL to read.

class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.text :description
    end
  end
end

# As we develop our app, we have more migrations. Each migration is a snapshot
# in time in how we've modified our database schema. This'll let us update,
# change and alter the structure of our database. When we do, we have a
# migration.

# We can add a t.timestamp to the table list. Migrating will handle the column
# for us. We will want the timestamp in every table, no matter what. Be sure
# to use the timestamp from the beginning, always.

# We can add an additional parameter to some of these info - contraints.

t.string :name, null: false

# Which means the gallery MUST have a name or else it won't be added.

# After we start the migration, we have to rake the migration:

rake db:migrate

# This completes what we've done and updates db/migrate/schema.rb:

ActiveRecord::Schema.define(version: 20140616145524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "galleries", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

# Rails completed the migration and has updated the file accordingly for the
# table to use. Migrate does, however, allow us to rollback with a command:

rake db:rollback

# This will rollback the database by one step. We can specify how many steps
# we rollback by using the additional extension STEP=number.

# Now with all this, our pages should work. We can also easily create tables
# now through the rails IRB console by using a rails special console to set up
# a default rails environment for us:

rails c 

# This will require erb and all necessary files for us. And we are able to
# connect to our databases and make changes that are saved to it with ease.

irb >>> Gallery

# This will establish our connection to Gallery. Then:

Gallery.create(name: "Wombats", description: "Wombats are fun!")

# This will add a new table, Wombats with desc: Wombats are fun! to us.


So the process of connection in rails is:


Browser/User -> HTTP Request to: App Server (webrick, etc) -> Forward to: Rails environment [ Routes match path and verb -> Forward to: Controller -> Talk to: Model ->]

 -> Talk to: db -> return data to -> Rails environment [ Model -> pass back to: Controller -> Talk to: View -> Generates HTML and passes back to -> Controller -> ] 

-> App Server -> Sends Response to -> Browser/User (form of HTTP response)


# Tired of writing:

<li> <a href="<%="galleries/#{gallery.id}"%><%=gallery.name%></li>

# Use link_to ! It'll generate the exact same anchor tag more concisely.

  <li> <%= link_to gallery.name, "/galleries/#{gallery.id}" %> </li>

# link_to takes a first argument which is the displayed text, with the 2nd
# argument being the link it is referring to.

# Now, are you also tired of writing forms?

<form action = "/galleries" method ="POST">
  <label for ="name">
  <input type="Text" id ="name" name="galleries[name]">

# Much like link_to, there's form_for!

<%= form_for @gallery, url: "/galleries/#{@gallery.id}" do |form| end>

# There are 7 actions for a resource! Each with an HTTP verb, and a path!

index = GET "/galleries"
show = GET "/galleries/:id"
new = GET "/galleries/new"
create = POST "/galleries/"
edit = GET "/galleries/:id/edit"
update = PATCH "/galleries/:id/"
destroy = DELETE "/galleries/:id/"

# Never need any other action other things! If you ever feel like you need any
# other action, slap yourself. Your controllers don't have to map one to one
# with models; so feel free to make more controllers or models.

# These are all available in one line to be loaded in the
# galleries_controller.rb:

resources :galleries

# We can add modifiers to that, as well:

resources :galleries, only [:show, :new, :create, :edit, :update, :destroy]

# This will default galleries to /galleries for the index. In which case, we
# can also specify to make the root point to the index as well:

root to:"galleries#index"


