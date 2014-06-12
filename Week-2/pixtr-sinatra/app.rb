require "sinatra"
require "sinatra/reloader"
require "pg"
require "active_record"

ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "photo_gallery",
  username: "postgres",
  password: ""
  )

  class Gallery < ActiveRecord::Base
    has_many :images
  end

  class Image < ActiveRecord::Base
  end

get "/" do
  @galleries = Gallery.all
  erb :index
end

get "/galleries/new" do
  erb :new_gallery
end

get "/galleries/:id/edit" do
  @gallery = Gallery.find(params[:id])
  erb :edit_gallery
  end

get "/galleries/:id" do
  @gallery = Gallery.find(params[:id])
  @images = @gallery.images
  erb :show
end

patch "/galleries/:id" do
  gallery = Gallery.find(params[:id])
  gallery.update(params[:gallery])
  redirect "galleries/#{gallery.id}"
end

post "/galleries" do
gallery = Gallery.create(params[:gallery])
redirect "/galleries/#{gallery.id}"
end


# cat_images_in_app_rb = ["colonel_meow.jpg", "grumpy_cat.png"]
# dog_images_in_app_rb = ["shibe.png"]
#   gallery_name = params[:gallery_name] 
#   erb(gallery_name.to_sym, {
#   	locals: {
#   	cat_images: cat_images_in_app_rb, 
#   	dog_images: dog_images_in_app_rb
#   }
#   })
