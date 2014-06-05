# Self is a way to refer to the object that is calling the code. For example:

# # 5.times do  # in this case, the way times work could be: #   def times # i
= 0 #       while i < self

# Self in this instance refers to the 5 which is calling the code.

#If we need to pass around code from one method or code to another, then we
#can use blocks. To obtain a block of code, an argument (&block) is needed.
#This is an ampersand. Then, within this code. use block.call to call the
#referred block. You can only take a single block argument, and the ampersand
#must be the last object on the argument list.	

# Blocks are anonymous methods/functions. Unlike other methods where it is
# defined and named, all that is between do and end has no name, but it is a
# method. Blocks do take arguments, but in the | | pipes. When the method
# using block.call is used, it can pass an argument to the argument in the | |
# when using block.call(arg).

# For example:

1.upto(10) do |n|
	puts n
end

# then we have:

def upto (limit, &block)
	i = self
	while i < limit
		block.call(i)
		i += 1
	end
end

# i refers to self, which means it refers to 1 (in this case, an Integer) The
# method upto calls %block, with an argument of i. This refers to |n|.  What
# upto ends up doing is changing the value of |n| through i. |n| however, is a
# new variable so keep that in mind. 

# Instead of using block.call(arg), you can also use 'yield (arg)', The arg
# refers to the block's pipe arguments (|n|). In this case, you do not need to
# pass ampersand block in your method.

#Keys are any kind of object - but they're usually symbols or strings.
