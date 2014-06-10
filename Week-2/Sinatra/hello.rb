	require "sinatra"

	get("/hello") do 
		"Hi there!"
	end

	get "/hello_with_header" do
		#status code
		#headers
		#body text
		status = 404
		headers = { "X-Gabe" => "Awesome"}
		body = "Gabe is teaching"

		[status, headers, body]
	end
