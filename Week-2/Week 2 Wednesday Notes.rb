# When we run yesterday's app.rb:

# We start a server on the port where we sent the request to (using localhost
# as server). Ruby has read the app.rb from top to bottom, and sees that there
# is a command for get "/:gallery name" do. It searches for the dynamic part
# of the URL (after /) when we use the right path on the browser. Once the URL
# finds the additional command (which is translated to :gallery_name). Then,
# the variable gallery_name will return the key value of params, a hash (with
# value [:gallery_name].

# ERB is a gem that takes a template or view and compile ruby into HTML as a
# massive string of HTML. So it reads gallery_name as a symbol as the .erb
# file name it will read, and locals - a hash that is the optional argument.
# It contains cat_images and dog_images, variable names that are keys that
# link to the array of cat_images_in_app_rb and dog_images_in_app_rb as its
# value. These 2 variable name keys are usable in the .erb file because of
# locals when .erb is run.

# Thus, when the .erb file is read and processed by erb in app.rb; it is then
# turned into a string, while processing the ruby (with the <% %> ) and
# allowing it to return everything when the browser receives the request
# (often producing it in HTML).

# We use <% %> instead of <%= %> when we don't want the literal result of the
# code to be displayed and rendered and shipped to the browser.

----------

# Instead of writing SQL for databases, we can use an ORM, an Object
# Relational Mapper. We can draw relationship between objects - and ruby
# essentially functions on objects. Ruby on rails will allow us to do this
# very easily.

# ActiveRecord is an gem ORM that can allow users to interface with the
# database and inherit its contents, instantiating records from it. It allows
# us to change the records from code itself.

# pg is an intermediary gem that links postgresql with psql. Both pg and
# ActiveRecord are required in a ruby program to allow access to postgresql
# databases. 

require "sinatra"
require "pg"
require "active_record"

ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "photo_gallery",
  username: "postgres",
  password: ""
  )

  class Gallery < ActiveRecord::Base
  end

# When put in ruby code, ActiveRecord::Base - namespacing so that ActiveRecord
# referred here (A class in active_record) is pointing to class Base within
# that class - is going to establish a connection in a command that takes
# several arguments. It needs an adapter, and a database name at the minimum.
# Username and password can be specified, as well.

# Next, the class Gallery inheriting ActiveRecord::Base is going to refer to
# the item Gallery in the database we established a connection to. It will be
# used in reference later on when we require it. It is CRUCIAL that the class
# name is singular, and that it is the singular form of the table name in the
# database (which HAS to be plural) 

get "/" do
  @galleries = Gallery.all
  erb :index
end

# A similar sight from yesterday's notes, the local: and list of self defined
# local variables no longer exist - instead, an instance variable is used. It
# takes in Gallery.all (which is akin to SELECT * from gallery) which returns
# a large array of all items in the gallery table. 

# Then, erb command is used on :index (basically, the .erb file you want to
# call erb on, as a symbol). After which, you can use @galleries in the ruby
# code for index.erb itself. It will return a string of text from index.erb,
# that will be passed into the browser when requested (With url domainname/)
# before being processed. Once the browser processes it, it returns it to the
# user.

 class Gallery < ActiveRecord::Base
  has_many :images
  end

class Image < ActiveRecord::Base
  belongs_to :images
end

# As the galleries table has a one to many relation with images, has_many
# :images refers to the foreign key of images and adds new methods on Gallery
# objects (it is CRUCIAL that naming of the foreign keys are written
# properly.) Likewise, belongs_to is called on the many to one relationship
# table. This adds new methods for either to be used and referred to, allowing
# access to the following commands (you do not need to call both on the
# relationship, only the one you need):

@gallery = Gallery.new
@gallery.images

@image = Images.new
@image.gallery

