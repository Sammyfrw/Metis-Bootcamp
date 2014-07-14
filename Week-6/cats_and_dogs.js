
var image = new Array (
	image1 = {type:"cat", 
			url:"http://files.dogster.com/images/dogster/pdfs/ikea.jpg"},
	image2 = {type:"cat",
			url:"https://hometowncolumbia.files.wordpress.com/2007/12/lol-cats-dont-look-behind-cat.jpg"},
	image3 = {type: "cat",
			url:"http://www.planetcalypsoforum.com/gallery/files/3/2/9/6/2/lolcat_what.jpg"},
	image4 = {type: "dog",
			url: "http://24.media.tumblr.com/tumblr_m6k3s4R2Gd1rtb3h0o1_500.jpg"},
	image5 = {type: "dog",
			url:"http://megalawlz.com/wp-content/uploads/2013/03/funny-dog-blends-into-carpet-pictures-lol.jpg"}
			);
var randomImage = image[Math.floor(Math.random()*image.length)];
var imageLink = randomImage.url;
var answer = randomImage.type;
$('#imageDiv').prepend('<img id="imageLink" src=' + imageLink + '>')

function imageLink(){
	randomImage.url;
}

function selection(choice){
	var result = $("#result");

	if (choice === answer){
		result.html("Correct");
	}
	else {
		result.html("Incorrect");
	}
}

$("#cat").click(function() {
	console.log("cat!");
	selection("cat");
});

$("#dog").click(function() {
	console.log("dog!");
	selection("dog");
});


