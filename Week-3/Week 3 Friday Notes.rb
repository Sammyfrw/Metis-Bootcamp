Active Support

$irb = shell command
> str = ruby code
#= Return value

Object.method <= Class method
Object#method <= Instance method

# Active Support - utility classes and extensions from Rails. Makes it way
# more awesome!

# To use outside rails, need to gem install activesupport.

# In ruby, you need to require "activesupport/all".

Callbacks

# Helpers that define and run callbacks. It lets you define when methods are
# able to be used at a particular time.

before_save :do_something

# This particular callback allows you to run code before saving the file. In
# Rails, callbacks are usually put in the model.

MessageEncrypter

# Allows encrypting messages with a key.

> salt = SecureRandom.random_bytes(64)

> key = 

> crypt

> encrypted_data = crypt
  encrypt_and_sign('mydata')

# is summed up into a similar code we've used already:

class user
  has_secured_password
end

Notifications

# Used for logging purposes. Executer instrument an event that should be
# subscribed to events: e.g. ActionView's "render" Active Record's "execute
# SQL"

TimzeZone

# Contains full mapping of timezones for various purposes. It allows changing
# and adjusting of the timezone used.

Core extensions

Array#from
Array#second
Array#forty_two

etc.

array = (1 ..100).to_a

Array#to_sentence

fruits = %w(banana strawberry kiwi)
fruits.to_sentence
=> banana, strawberry, kiwi

Array#in_group_of

array.in_group_of(3)

Time, Date, TimeDate
time = Time.today
time.beginning_of_day
time.all_day

# etc.

Hash

# Hash#deep_merge lets you merge two hashes together without overwriting any
# keys of a similar name by adding onto the values that hte key has.

# Hash#stringify_keys or Hash#symbolize_keys will do:

hash = {one: 1, 'two' => 2}

hash.stringify_keys
=> {'one' => 1, 'two' => 2}

hash.symbolize_keys
=> {one: 1, two: 2}

# Useful to standardize information input.

# Hash#reverse_merge is essentially the hash.merge method but reverses the
# overwriting preferences (keys of same name with the first value will
# overwrite the second instead of normally 2 overwriting the first)


Integer

# Integer#ordinalize returns "1st, 2nd, 3rd" when called on 1, 2, 3.
# Integer#days/#months/#years allows you to use things such as 1.month.ago,
# 1.month.from_now, etc.

Object

# Object#present and Object#blank - self explanatory. OBject#try allows you to
# try to call an object on a method. If it returns nil, there's an error.
# Essentially, you don't need to hit an error.

user.try(:name) #=> nil

# Object#presence allows you to:

puts "Hello#{name.presence? || "Guest"}"

# Where if name is absent, it'll put Guest instead.

# String#to_time, String#to_date, String_todatetime enables putting in tha
# date as a string.

# String#truncate will take a number parameter and cut a word once it reaches
# that number.

Inflections

# String#pluralize, #singularize, #camelize, #titlize #humanize will perform
# pluralize, singularize, camelcase, titling and humanizing a name.

# String#inquiry will:
color = "red".inquiry
color.red? => true
color.blue? => false 

pram@thoughtbot.com
