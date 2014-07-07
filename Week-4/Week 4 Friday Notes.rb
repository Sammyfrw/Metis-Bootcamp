# We have to consider internationalizing our web apps, especially through the
# design. How do we make it in french, or japanese, or german?

# Rails has a helper method, t to call I18N internationalization:

<%= link_to t(".call_to_action", count: Hello.count), new_hello_path%>>

# it also has an l, for localization.

# Rails places a lot of consideration on how it can generate international
# presentation files. It assists things greatly in the process. It supports
# converting and pathing. It's important to set locale in the
# ApplicationController, however.
