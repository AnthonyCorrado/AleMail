jQuery(document).ready(function($){
	$('input[type="checkbox"]').click(function(){
    if($(this).attr("value")=="phone"){
        $(".hidden-phone-field").toggle();
    }
    if($(this).attr("value")=="email"){
        $(".hidden-email-field").toggle();
    }
	});
	$('#beer_choice_one').change(function(){
		if($('#beer_choice_one').val() !== null){
			$(".beer-select-two").css("display", "block");
			$('#beer_choice_two').change(function(){
				if($('#beer_choice_two').val() !== null){
					$(".beer-select-three").css("display", "block");
				}
			});
		}
	});
	if($('#beer_choice_two').val() === ""){
		$('.beer-selected-two').css('display', 'none');
	}
	if($('#beer_choice_three').val() === ""){
		$('.beer-selected-three').css('display', 'none');
	}
});


