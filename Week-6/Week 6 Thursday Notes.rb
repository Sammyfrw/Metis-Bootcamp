# Suspenders is a gem for people who have not written the code of an app.
# Gitsh is a gem that makes using Git easier without repetitive typing of git.

# Websockets are tools that allow us to send a request without requiring an
# immediate response. The client can send information to a server, and remains
# established until it is closed. You can have multiple clients connected to
# the server, and the clients can send requests to each other. Even if the
# other clients do not request it, they will receive it.

# This behaviour is different from HTML, where they request for pulls.

# Environment variables are local to your computer and your own computer only.
# You can set your own environment variable on heroku which acts as its own
# host computer (in case we use environment variables in our app):

# ENV is a ruby hash that contains every environment variable that your app
# could have. You can obtain it by ENV.fetch("var_name"). Note how we don't
# use ENV["var_name"]. This is because if a key doesn't exist when you try to
# call it, then it will return nil. Luckily, .fetch will return an error if
# the ENV doesn't exist (in brackets). This way, we can catch any errors
# immediately, otherwise we might be running the app with a nil value which
# might break things. 

# However, we need to set environment variables where necessary on all
# computers running our app. To do this, we need to add a gem. dotenv-rails
# will let us do that.  Once we install, we don't want it to set up envs for
# us and let them get uploaded to git: we want to add our .env to our
# gitignore folder. Now, when we run rails s, our gem generates our ENV files
# for the rails session for us.

ENV files will be in the .env at the root directory of our app.
