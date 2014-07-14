	var guesses = 0;
	var winningNumber = Math.floor((Math.random() * 10) + 1);
	console.log(winningNumber);
	function guess(){
		var guessesMade = document.getElementById("guessesMade");
		var userGuess = Number(document.getElementById("userGuess").value);
		
		guessesMade.innerHTML = guesses + 1;
		guesses ++;

		if (userGuess === winningNumber) {
			window.alert("Good job!");
			winningNumber = Math.floor((Math.random() * 10) + 1);
			}
		else{
			window.alert("Boo!");
			}

	}
