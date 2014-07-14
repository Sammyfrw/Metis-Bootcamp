# # Rack is used by Rails, Sinatra, etc, it is also used in many gems such as Monban, authentication based gems and documentation, etc.

# # What does it do? It handles incoming HTTP requests.

# HTTP: Asks a server to return resource(GET), create(POST) or others (PATCH,PUT, DELETE, etc).

# Requests are sent to URL. We get a status code in response.

# Headers contain metadata such as content type, caching rules, etc.

# Body contains the requested resource. Chrome has several devtools to look at these things. 

# Each framework (Rails, Sinatra, custom frameworks) has to interact with many
# different kinds of servers running different things. For each framework, it
# needs to be able to work with it. This creates a jumbled mess. Rack handles
# it for us!

# Rack is a great model for HTTP request/response model. The official rack
# spec is a ruby object that responds to call, takes exactly one arg - the
# env, and it returns an array of 3 values: status, headers, and body. It must
# respond to each.

# The env is a hash containing a lot of information about the request and who
# made the request. It's a lot, but while it may be a lot on its own, Rack's
# strength comes in when Rack apps are chained together to enforce its
# position as middleware.

# Dependency injections can be used to not hardcore things, passing names as
# an argument. That way, very little things need to be a dependency that is
# hardcoded. With middleware, each app gets a chance to change the env
# argument passed in before it moves up into the next app in the chain,
# changing status, headers and body before it returns.


