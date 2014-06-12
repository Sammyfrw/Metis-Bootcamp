# Forms are how new data is entered from the browser into the server/database.

# If we made a form in get "/galleries/new", it has to be above
# "/galleries/:id". Because :id will look for anything in past the :, so a /new
# path loaded after :id will be read and treated as /galleries/:id.

<h2>New Gallery</h2>
<form method="POST" action="/galleries">
  <label for="gallery_name">Gallery name: </label>
  <input id="gallery_name" type ="text" name="gallery[name]">
  <input type ="submit" value="Create gallery">
</form>


#id for <label> needs to match the id name of what you're inputting.


post "/galleries" do
  gallery_params - params[:gallery]
  gallery_name = gallery_params[:name]


Gallery.create(name: gallery_name)
end

# Nested params in this case refers to what we input in /galleries; it will
# look up what the gallery_name is and it becomes the key of a hash, with the
# value of a hash (key, name, value, user input).

# Gallery.create is a way to create a new record in the database. If we want
# to take specifically for the column 'name', we have used (name:
# gallery_name) to specifically take gallery_name parameter. However, if the
# hashes are set up in gallery_params we can simply just use gallery_params
# (the gallery_params is a hash containing the various fields that we've
# inserted into it: name=userinput for name, colour = userinput for colour,
# etc.)

Gallery.create(gallery_params)

or even

Gallery.create(params[:gallery])

# And that will work all the same. To redirect people to the gallery they just
# made:

post "/galleries" do
  Gallery.create(params[:gallery])
  redirect "/galleries/#{gallery.id}"
end

# Forms will only ever receive POSTS or GET. So to delete something, we need to fake it.

<input type="hidden" name ="_method" value ="PATCH">

# This tells sinatra that even if we're sending a post, we're actually sending
# a patch. If sinatra finds a method, it will use this
# method over the action described in form method instead.


# Requests have a VERB and a PATH. (e.g. GET /galleries/3/edit) 
# Responses will be the response code and HTML (200 + HTML) 
# The HTML can be a new page altogether.(e.g. an edit page.)
# Change the name of gallery to burgers, click submit - a NEW request!). 
# This new request on clicking submit is a POST (POST /galleries/3)

# The POST will have a body in the html; it has a key _method and a value
# PATCH. Additionally, gallery[name] key will have a new value, burgers.
A
