require "sinatra"

get "/:gallery_name" do
cat_images_in_app_rb = ["colonel_meow.jpg", "grumpy_cat.png"]
dog_images_in_app_rb = ["shibe.png"]
  gallery_name = params[:gallery_name] 
  (erb gallery_name.to_sym, {locals: {
  	cat_images: cat_images_in_app_rb, 
  	dog_images: dog_images_in_app_rb}
  	})
end

##erb lets you render html file with embedded ruby - putting ruby in your
##files. It will change your ruby in your files and mix with HTML. In this
##case, it looks for a cats.erb and presents it to the browser.
