Terminology:

-- SELECT (name, age) -- This is a select clause. Name and age are columns in
a table. FROM (students)-- This is a FROM clause. In this case, students is a
table. JOIN (instructors) ON students.instructor_id = students.id -- This is a
JOIN ON clause.  --students.instructor_id is a qualified column. It refers to
instructor_id column in students table. --Additionally, instructor_id column
is a foreign key - it exist as a point of referenece for the purpose of JOIN
ON. WHERE age = 25 -- THIS IS A WHERE clause. They have predicates (age = 25).

-- It is a safe assumption that every table will have some form of a unique
-- identifier ID column; you also do not NEED to use a qualified column if you
-- refer to the columns in FROM, but it is good convention to; thus SELECT
-- should have students.name, students.age. Also, JOIN ON can be followed by
-- AND (not recommended), and it doesn't matter which tables are selected in
-- FROM and JOIN if they are essentially going to be linked in the ON clause.


GROUP BY -- This is a GROUP	BY clause. This creates groups based on what the
-- columns are grouped by.

SELECT MAX(students.age)
FROM students
JOIN instructors ON students.instructor_id = instructors.id
GROUP BY instructors.id

-- Wtihout group by, it will select all students regardless of instructors.id.
-- But once group by is used, it makes groups based on the number of instructors'
-- ids and take the max student age for each instructor ID.

-- \d is typed at the PSQL prompt to tell you the names of all the tables. You
-- \can also change how columns are displayed to the user with an AS clause
-- \following SELECTING the particular column. E.g. "SELECT galleries.name AS
-- \gallery_name, images.name AS image_name". Once this alias is written out,
-- \the rest of the SQL code is able to use them.

-- The Postgres docs are amazing.

ORDER BY COUNT(images.id) DESC -- ORDER BY clauses order the results by the argument. 

-- The argument can be an aggregate function, like COUNT. Following this, a
-- ASC or DESC is used for ascending and descedning respectively.


=====
-- Web servers are computers on the internet that host data that can be
-- requested for that data. In a scenario, say that you connect to google.com.
-- It resolves a DNS (173.194.116.55, e.g.) that is unique to google. We send a
-- request to google's servers, and they will return the content to us.



-- HTTP:// is a protocol on how the website is rendered or loaded or treated -
-- basically there are many protocols that function very differently.

-- google.com is the domain name. Any prefix (us.google.com) is a subdomain.
-- It is the address/name that resolves to an IP address, once set. It allows
-- browsers to point to an IP address via the domain name.

-- Any text after the / is a path of the URL. It can also have additional
-- arguments: /search?lang=english&q=hello - the path and the parameters will
-- change extra information to the web server. Some parameters in the path are
-- queries (such as ?lang=english and q=hello) A hash path in the web URL is
-- accessible in the response, but the web server cannot see anything after
-- the hash. Unlike a query, a hash path is static.	

--- In a request, you have a VERB+PATH. VERBs take data in some form. You can
--- set it up to take one or all of the following depending on your settings -
--- these requests are all part of convention.

--- GET, POST, PUT, PATCH, DELETE. 

--- GET is the most common verb. It puts in a request to 'get' the data from
--- the path. It sends some data in the form of queries. There is a limit to
--- the amount of data able to be sent with a GET request; to overcome this,
--- POST is used instead. You get data from GET.

-- POST requests have no limit on uploading - it creates new data on the
-- server itself. Things like submitting forms and uploading photos are POST
-- requests. It creates a new user resource on the server. Limits can be set,
-- but not via the URL. POST uses an upload_file and can take data.

-- PATCH is used to update existing data - if it doesn't exist, nothing will be created. 

-- PUT combines POST and PATCH. It sends data, and if it finds that data
-- doesn't exist yet, it will create the data. and if it already exists, it
-- will update it.

-- DELETE requests will delete existing data.


-- Responses to Requests are much simpler: Status Codes, and body. Status
-- Codes are numbers - 404, 502, 403, etc. Each hundred means various things.
-- The body is usually an HTML file/data. 

---1xx - informational

---2xx - successes - this is usually in GET request responses. 201 means resource created.

---3xx - Redirection - 301 is moved permanently - it means it knows what you
---are asking for, but then you are redirected to another location. This
---particular code is user made to allow redirecting of people.

-- -4xx - client error - 404 is the most common; it can also be a 403, but it
-- -is up to the domain owner to set up which it is and what it displays.

---5xx - server error - the server is messed up - if the server raises an
---exception and failed to fulfill an apparently fulfilled request, a 5xx
---error is displayed. For example, it's a failwhail at twitter - that's a
---5xx.


-- Headers are used to define and determine the properties of a website. These
-- can explicitly mention what elements/features are available on the website:
-- who is the host of the website, what type of content the site accepts, what
-- language it is allowing, etc. Similarly, responses also contain headers.


--------------------
-- Homework:

-- Low fidelity sketches (easy), and an ERD. an ERD is a entity relationship diagram of how your website will look.


--------------

-- Gems are ruby packages of code that can be installed externally and into
-- your system via command prompt as necessary. Due to this, it can easily
-- download/install files, then the user can read/write with those packages.

---Sinatra is a gem - a DSL to create web applications in Ruby. DSLs, or
---domain specific language creates easier responses to HTTP verbs and
---requests.

-- Sinatra allows new syntax that mimic similarly to an HTTP production
-- environment; adding new methods and with their own parameters, arguments, etc.
-- in ruby.

When running sinatra, you send data to the browser, instead of the screen - the block can handle what is on the screen. In the example hello.rb:

	get "/hello_with_header" do
		#status code
		#headers
		#body text
		status = 404
		headers = { "X-Gabe" => "Awesome"}
		body = "Gabe is teaching"

		[status, headers, body]
	end

-- The triple array, regardless of what the variable names are will always be
-- status, headers and body. You can manually define these with that
-- particular format. Once it receives the verb (get) and the element
-- (/hello_with_header), the program will override the status, header and
-- body. If it successfully connects, it should normally be a 200, but this is
-- overriden to a 404.

------------
require "sinatra"

get "/" do 
  erb :cats
  
end

##erb lets you render erb files - an HTML file with embedded ruby - putting
##ruby in your files. It will change your ruby in your files and mix with
##HTML. In this case, it looks for a cats.erb and presents it to the browser.

-- <% = "Hello" %>  placed inside HTML code, when erb is called on an erb
-- file,  -- will treat the item between the brackets as ruby code. This allows
-- the ruby code to be called -- first and processed, before the HTML code.

-- Sinatra will run erb and look for erb files in ./views, while looking for
-- elements that need to be loaded such as images, css, etc. in ./public. Make
-- sure these files are inside on running erb.

-- We can change the direct reference of the symbol cats directly into user
-- input in the browser to let it look for that particular erb file. This lets
-- us minimize duplications for every gallery that might exist in this next
-- example (cats, dogs, wombats, etc.)

get "/:gallery_name" do
  gallery_name = params[:gallery_name] 
  erb gallery_name.to_sym
end


-- params is a huge hash containing data provided by the user. Any information
-- user puts in, will be placed into params. User's input is usually taken in
-- by the URL or a form. In this case, :gallery_name is the key. The colon in
-- "/:gallery_name" is necessary, because it says anything after the slash is
-- what get is looking for.

-- In the gallery.html file, we have:

<img src = "img/grumpy_cat.png" > 
etc.

-- for each image. There should be a way to use ruby that lets us go through every cat image in the gallery folder and print it out!

<%= cat_images.each do |cat_image| %>
  <img src="img/<%=cat_image%>" alt= "<%= cat_image%>">
<% end %>

-- Ignoring the fact that for now where cat_image is coming from....

get "/:gallery_name" do
cat_images_in_app_rb = ["colonel_meow.jpg", "kitty.jpg"]
  gallery_name = params[:gallery_name] 
  erb (gallery_name.to_sym, locals: {cat_images: cat_images_in_app_rb})
end

-- cat_images_in_app_rb is a variable is an array containing the filenames in
-- strings. And locals is a key of a hash containing the key :cat_images with
-- value of cat_images_in_app_rb. The values inside the hash with key locals
-- can contain many hashes with values, and the keys of those hashes are what
-- we will refer to in the HTML file, producing the values of those keys.

-- So, with that example above, we can use cat_images in our ERB'd html file's
-- lines, to obtain the cat image filenames stored in cat_images_in_app_rb.
