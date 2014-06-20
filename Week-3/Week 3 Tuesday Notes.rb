# REST - Representional State Transfer. RESTFUL means something conforms to
# what REST is. It relies on resources in HTTP; REST conforms to CRUD (Create,
# Read, Update, Delete) where most of which aligns to the HTTP verbs and the
# respective actions. Except for new and edit.

# Within our application, the gallery is a resource, allowing us to CRUD via the
# verbs/paths structured around the ideas of collections and elements.

# If we need to review the routes we have, we can go to /rails/info/routes on
# the browser for a rails helper.

  resources :galleries do
    get "/images/new" => ""
  end

  # We can fill in the REST resources up with new paths by simply making a
  # block beneath it. This way, we can make new routes based on prior routes.


# Gallery is a model (class, backed by ActiveRecord), and Gallery.new makes an
# instance of it. It is the m in MVC.

Rails S boots up the App Server.

Routes refers to the routes.rb.
Controller refers to the _controller.rb.
Models refers to the modelname.rb file. 
View refers to the .html.erb file.
DB refers to the database.

So Request -> App Server -> Routers route the request to the appropriate
Controller, which instantiates the Model, that allows interaction with the DB.
It then renders the View, which is sent back to the browser as a Response.

We instantiate the model from controller when we do:

  def new
    @gallery = Gallery.new
  end

When we use:

private

def image_params
  params.require(:image).permit(
    :url
    ....
    ....)
end

# We are using hard params - by default rails prevents accessing all params
# unless specified. The reason for this is for security purposes. Using
# image_params or table_params like this will allow us to safely access
# parameters.

<%=image_tag(image.url) %<>

# image_tag helper replaces <img src="url"> and also includes an alt.

Do not make new routes!

  resources :galleries do [:show, :new, :create, :edit, :update, :destroy]
    resources :images, only: [:new, :create]

    # get "/images/new" => "images#new"
    # post "/images" => "images#create"

  end

# Look at the commented sections. No. Don't do that. Nest your resources tag
# instead, like just above it.

# Want to make a new branch, just next under :galleries. Want to nest further,
# nest under :images (use the do:end too!)

app.polymorphic_path(gallery)

# App is a special object that allows you to call every special rail helper
# methods on it. polymorphic_path helper is an internal helper that returns
# the path for the current link - it is run many times in the background; like
# when we call form_for. It takes an object, and tries to turn it into a path.
# It first takes the name of the model in its method, and checks if it is
# persistent and has an ID. A route MUST be defined within the route file
# associated with that path.


<%= form_for @gallery, url: "/galleries" do |form| %>>

# Because @gallery ActiveRecord object contains all the information we need
# for this particular form, including the route path, thanks to rails we can
# shorten that and not have to worry about the url.

<%= form_for @gallery do |form| %>>

# You can do this for -everything- where a URL is specified:

<li> <%= link_to gallery.name, "/galleries/#{gallery.id}" %> </li>>

# In this instance, you can replace the url into gallery:

<% @galleries.each do |gallery| %>
  <li> <%= link_to gallery.name, gallery %> </li>
  <%end%>>

# And then:

<%= link_to "Delete gallery", "@gallery", method: :delete%>>

# Instead of the whole url for @gallery, just put in @gallery!

<%= link_to "Add image", [:new, @gallery, :image] %>>

# Sometimes it can be a bit confusing, but the rails helper can point you to
# ideas on how to solve the issue:

new_gallery_image_path

# Is on the helper for this particular path we're looking for.

# In this case, we'll want to indicate that it's a new object, located within
# @gallery path, to make an image.

validates :name, presence: true

# Adding this onto the model file (gallery.rb, image.rb) in the class will put
# in a constraint onto the database record via Rails (this is akin to
# constraints in PSQL, but only run through rails). This adds a validation
# step to the name that it HAS to have a presence (as in, not empty or not an
# empty string).

def create
    gallery = Gallery.new(gallery_params)
    if gallery.save
      # gallery = Gallery.create(gallery_params)
      redirect_to "/galleries/#{gallery.id}"
    else
      @gallery = gallery
      render :new
  end

# This can then prevent the rails error page from showing up. Gallery.create
# is simply a bundle of Gallery.new and gallery.save. This time, if
# gallery.save doesn't succeed (aka, invalid name), then we can just render a
# new instance of the new page once again (all controller methods are capable
# of directing and calling each other). In this case, we don't want the fields
# to be lost, however - it can be troublesome for the users if everything is
# lost if they forgot one field. This is why we save the gallery into an
# instance variable, and render a new, keeping in mind of what was already put
# in instead of simply calling new.

# Partials are extracted bit of views that you want to repeat multiple times.
# Examples of this are the edit.html.erb, which is identical in most cases
# between tables and also identical to new.html.erb (mostly, if not all, too).
# We can render a 'form' once we make it to render a partial.

<%= render 'form'%>>

# It will look in the apps/views/(current table).

# Persistent files are items in the database; which is what form_for and
# link_to is looking for - their request verbs will depend if there is an
# existing, persistent object in the database.


# In class, it is preferred that we use our objects, so we use the path names
# instead of directly referring to the path. Such as gallery, image, root_path
# instead of /galleries, /galleries/:id/images, or /. Never hardcode the path!

# It's best to use a format:

link_to "Galleries", [:new, @gallery, :image]

# For /galleries/:gallery_id/images , image#create

# For the line. We use the instance variable for gallery because we need to
# reference a particular gallery ID number (which we got earlier from @gallery
# = Gallery.find(params[:id])).


