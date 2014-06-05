#Use require to use methods outside the core API such as the Standard Library.
#Use require "set" gets all of the standard library. You can require for the
#current directory with a "./scriptname".

#$LOAD_PATH refers to the load path where ruby looks for its scripts.

#Some bang methods in the library (such as upcase v. upcase!) will do
#different things. In the example of upcase, upcase will copy and return an
#upper case'd string that was copied - NOT the string itself. With upcase! you
#will return a changed original string.

#Use irb to boot up the irb terminal in command prompt. You can use exit to
#exit.

# Octothorp methods or instance methods (#%) allow you to call a method on an
# object that is part of a class that contains that method. (e.g. you can all)

#In ruby documentations, there are 2 kinds of classes: (C) classes and (M)
#modules. Modules are intantiated, whereas classes can be called. (::) methods
#are class methods, while () are instance methods. Class methods allow you to
#call classes


# You can 'name' your newly created class by using an argument after the .new making the class. 
# For example, wombat = Wombat.new("Fred")

# You can override ruby methods by just defining it again in a method. e.g.
# def to_s. It is important to make sure you don't override the command if you
# plan on using its default function elsewhere. Make sure it's only applicable
# to places where you wouldn't run into issues.
