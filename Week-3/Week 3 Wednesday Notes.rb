# Finding errors:

# We can use .errors or .errors_full_messages to return an error in rails
# console if one is made when the command is run; this is better than .raise
# if the error isn't ruby specific.


# Again with partials, we can do the same with error messages.

    <% if @gallery.errors.any? %>
  <h2> THERE WERE ERRORS! <%= pluralize @gallery.errors.count, 'error'%> on this form! </h2>
  <ul>
    <% @gallery.errors.full_messages.each do |message| %>
  <li>
    <%= message%>
  </li>
  <%end%>
  </ul>
  <%end%>
>
# => Remember _form.erb.html? Now we can use _error_messages.html.erb! Now in
# => our respective html file such as new.html.erb:

# To create a new branch in git, use the checkout command:

git chekout -b. auth

# We will then have a new branch .


# When storing password in a database, it should be encrypted into a password,
# digested version, as a string.


# If we assign to the model the has_secure_password method, it will encrypt
# password fields for us

class User < ActiveRecord::Base
  has_secure_password 

  validates: :email, presence: true, uniqueness: true
  
end

# Uniqueness will mention that whatever entry is put in is unique, as well.
# has_secure_password will determine that password and password_confirmation
# fields are the same.

get "/sign_in", to: "sessions#new"

# Sessions are specific to signing in onto a user for access. Only one
# instance of it can exist at a time 


# has_secure_password gives access to the .authenticate method called on an
# object that'll check for the password ID:

user.authenticate(params[:session][:password]) 

# To be used during log in.

# If we want to define a method that should be available in all controllers
# and views, we should define it in application_controller.

def current_user
  if cookies[:user_id]
    User.find(cookies[  :user_id])
  end

# Cookies can be referred to for data stored in the browser. Additionally,
# once the method is defined we can label it was a helper_method:

helper_method :current_user

# With it being a helper_method, we can use it in our views. Be careful about
# using cookies; people are able to create cookies on their own and they could
# potentially trick the webpage to allowing a browser to be signed in.

# When checking if a user is signed in, we can use a signed_in? method to return
# true or false:

def signed_in?
  current_user
end

# Will be enough to return true if the user is found within the cookies.
# However, cookies can be made by scripts, so we have to encrypt and protect
# our cookies when we set the cookies:

cookies.signed

# is an important command to consider to encrypt your cookies:

if cookies[:user_id]
  User.find(cookies.signed[:user_id])
end

# every time someone needs to check if they have the right cookie, as well.

#BUT WAIT THERE"S MORE. Tomorrow, we'll learn how to make it easier.