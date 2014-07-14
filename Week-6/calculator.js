$(function(){
	$("form").submit(function() {
		calculate();
		return false;
	});

});
	function calculate(){
		var left = Number($("#left").val());
		var right = Number($("#right").val());
		var operator = $("#operator").val();
		var result = $("#result");

		if (operator == "+") {
			result.html = left + right;
			}

		if (operator == "-") {
		result.html = left - right;
		}

		if (operator == "*") {
		result.html = left * right;
		}

		if (operator == "/") {
		result.html = left / right;
		}
	}

