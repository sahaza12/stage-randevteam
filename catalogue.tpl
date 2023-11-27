
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<div class="container">
<form method="post">
	<div class="form-group row">
		<h4 style="text-align:center;">Veuillez remplir l'email avant de télécharger</h4>
	</div>
	<div class="form-group row" id="formcatalog">
		<input class="required form-control" id="from" type="email" value="" placeholder="E-mail" >

	</div>
	<div class="form-group row" style="text-align: center;">
		<input type="checkbox" name="checkbox[]" id="checkbox1" style="accent-color: black;"  value=" "/>
		<label for="checkbox1" style="border: 0px solid black;font-size: 11px;">Non je ne souhaite pas être recontacté par mail par un commercial</label>
		<input type="hiden" name="checkbox1" id="input" value="" style="display: none;">

	</div>
	<div id="btn-centre">
		<button type="submit" id="envoie" class="btn btn-primary">Envoyer</button>
	</div>
	<div id="succes" style="display: none"></div>
	<div id="error" style="display: none"></div>
</form>
<script>


	function checkFilled(el){
		var filled = true;
		Array.prototype.forEach.call(el, function(elements, index) {
			if(!elements.value){
				filled = false;
			}
		});
		return filled;
	}

	$("#envoie").click(function(e) {

		e.preventDefault();

		var allForm = document.querySelectorAll(".required");
		const checkbox1 = document.querySelector('[type="checkbox"]');
		var email = $("#from").val();
		var checkboxval=$("input[name='checkbox[]']").val();

		if (checkFilled(allForm)){
				window.scrollTo(0, 0);

					/// use ajax to send
					var data = {
						emailFrom: $("#from").val(),

					};
					var data1 = {
						values: $("input[name='checkbox[]']").val(),
					};
					const checkbox1 = document.querySelector('input[type="checkbox"]');
					data1.values = checkbox1.checked ? 1 : 0;
					//console.log(data);

					$.ajax({
						type: "POST",
						url: "/themes/classic/templates/test.php",
						data: $.extend(data, data1),
						success: function(data,data1){
							$("#error").hide();
							$("#succes").html('<center>Email envoyée</center>');
							$("#succes").show();
							document.querySelector("#succes").scrollIntoView();
							window.location='/content/157-remerciement-demande-catalogue';
						}
					});
		}
		else{
			$("#successMessage").hide();
			$("#error").html("Email invalide");
			$("#error").show();
			document.querySelector("#error").scrollIntoView();
		}
	});

</script>

<style>
#succes,
#error {
	padding: 0.75rem 1.25rem;
    background: #dff0d8;
    color: #3c763d;
    margin-top: 50px;
    width: 450px;
    margin-left: auto;
    margin-right: auto;
}
.required::placeholder {
	text-align: center;
	color: #fff;
}
</style>

