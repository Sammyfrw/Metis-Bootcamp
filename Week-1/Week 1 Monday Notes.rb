<!-- DOCTYPE tells what kind of a document it is e.g. html).
		Use <!DOCTYPE html> to state that the document is using HTML. Very important, required.

		Use <html> to describe html. Required.
		
		<head> is where title, external stylesheet link, information about the page such as charset are described. For the browser.

		<meta charset="UTF-8"> is defining the charset to UTF-8. UTF-8 has a lot of characters (think ASCII but more characters) that is used by the browser. Not required but without the browser will use a default.

		<title> makes the title. Required for HTML standard, otherwise browser will generate the title name with the document file.

		<link rel="stylesheet" type="text/css" href="style.css"> links the html document to the stylesheet. Not required but makes the document pretty so it's virtually necessary. Link will load the file and stop the browser loading the current file when it reads the document; therefore bigger documents to be loaded should be placed lower before </body> via a script. In this case, CSS is loaded that decorates and beautifies the HTML file visually.

		<body> Describes what the user will see.

		<h1> Describes the first header. HTML standard says only 1 per page, unless in sections to have more 1 per section.

		<div> are containers; it doesn't -say- anything and doesn't define anything. It just contains things within it. It allows for attributes with values inside it such as id="name" to define that particular container and what it contains. 

		<h2> is the 2nd header/subheader. Can use as many as desired.

		<ul> defines an unordered list.
		
		<li> defines a list item within the list. Bullet point, number, etc.
		
		<a href="cats.html"> a is an anchor, and href="url" is the url that the element will link to.

		Convention for naming ID and class, etc in HTML is dashes for spaces (unlike Ruby which uses underscores!)


===============
In CSS, you have the selectors (h1, body, #galleries, .image, etc) - it'll take a tag, id or . The selector will have declarations within brackets that define all items with that tag. The declaration contains a prpoerty and its value (color: magenta).

	CSS loads via specifity. It is possible to have 2 selectors that define the same properties, the lower one will then take priority over the higher one in the CSS document. But, if one selector has multiple selections (body h1 vs. h1), the more specific one will take priority. HTML default has its own formatting, and CSS allows overwriting that or inline formatting (which isn't recommended) The # will select any tag using an id. 

	IDs are for specific elements, but classes are for many different kinds of elements. Use .class to target classes, #id to target ids.


	In case of targeting a direct descendant element instead of all elements within a tag:

	<div id="wombat"</div>
		<p>Wombats are fun!</p>
		<div>
			<p>Yes they are!</p>
		</div>

		Use a descendant selector to target the direct descendant line in CSS:
		#wombat > p {
		color: red
		}

	Comments in css are // for single line. /* will make a multi line comment, end with */.

	Pseudoselectors: for example.
	a { 
		text-decoration: none;
		color: green;
		}

	a:hover { 
		text-decoration: underline;
		color: green;
		}

	This allows you to select something during a particular action such as hover or click(active). These are usually specific; anchor (a) text can use hover, click, visited, etc but they don't apply to e.g. id/classes.

	

	Homework: Think of application that you would like to make. Have a problem, something you want to solve. A few sentences, research. When complete, send an email to jsteiner / gabe @thoughtbot.com

	===============================
	Ruby

	In Ruby, all filenames are lowercase and separated with underscores. Like all variables, too. When making a class, and using a variable, all variables should be name of the class, too. They should be the same, with the Class being UpperCase and no spaces, variable with lower case with variable. (guessing_game = GuessingGame.new)

	Make your methods very clear - they should be intuitive. Make sure others and yourself find it intuitive to read - no matter how much time has passed.

	.inspect is a method that'll give ruby's interpretation of a variable. For example, if you gets.chomp a number, 3, using .inspect will show what ruby thinks = it comes out as "3" aka a string of 3. If you use gets and put in 3, with .inspect you'll get "4\n".

	Class is a factory for instances. Variable = class.new creates a new instance of said class. @variables are instance variables. They allow all functions within an instance of a class to access the variable. Use if a variable needs to be called across the scopes within a class. Local variables by comparison do not exist outside the scope. When a new instance of a class is made via .new, a method inherrent to classes called initialize is run. When this method is run, it is useful to set up the instance with instance variables, etc at the very start.

	Return values are usable in the place of instance variables - this allows you to use instance variables without typing the @sign - saves time. Define a method with the instance variable's name (Without the @ sign) that returns the instance variable at the end. This allows changes to the instance variable at the method itself if necessary.

	Constances are variables that cannot be changed once started. They are written in all caps. (MAX_GUESSES) They are different from instance variables in the sense that they are defined before initialize.

	You don't need to compare a true boolean if it is true or false, because it is redundant:
	
	true == true
	is always true.
	
	false == true
	is always false.

	therefore, you just need to say if (trueboolean), no need for the conditional comparison to true/false.


	Predicate methods are methods that end with a question mark. This allows programmers to understand that this is a question to be asked. We can use this to return an instance variable when we want to bring up a boolean instance variable.

	Bang methods are methods that end with an exclamation mark. This can be used to execute a method that changes an instance variable when we need to (in particular, booleans)

	Using private and public will allow/disallow methods to be called from outside the class. Private methods in the class gives the author of the code the freedom and a declaration that code beneath it will be subject to change by the author. 