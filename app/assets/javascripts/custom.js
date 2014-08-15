jQuery(document).ready(function($){
	// hidden phone/email fields become visible in edit page if filled
	if( $('input#patron_phone').val()){
		$(".hidden-phone-field").toggle();
		$('input[name="phoneCheckbox"]').each(function(){ this.checked = true; });
	}
	if( $('input#patron_email').val()){
		$(".hidden-email-field").toggle();
		$('input[name="emailCheckbox"]').each(function(){ this.checked = true; });
	}
	// sets checkbox action to hide/show phone and email fields
	$('input[type="checkbox"]').click(function(){
    if($(this).attr("value")=="phone"){
        $(".hidden-phone-field").toggle();
    }
    if($(this).attr("value")=="email"){
        $(".hidden-email-field").toggle();
    }
	});
	// if first beer is selected, second beer selection becomes available, ect. 
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


