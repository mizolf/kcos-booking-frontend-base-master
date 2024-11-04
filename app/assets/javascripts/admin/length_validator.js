// TO USE JUST ADD CLASS TO TEXT FIELD class: "js_validate_len-max(100)"
$(function(){
	$("[class*='js_validate_len-']").on('keyup keypress blur', function(e){
		let max = parseInt($(this).attr('class').split("max(")[1].split(")")[0]);
		let current = $(this).val().length;
		if($(".js_counter-"+this.id).length == 0){
			$(this).after("<span style='display: none;' class='js_counter-"+this.id+"'></span>");
		}
		$(".js_counter-"+this.id).text($(this).val().length+"/"+max);
		if(max<current){
			$(".js_counter-"+this.id).addClass("field-error");
			$(".js_counter-"+this.id).removeClass("field-success");

		}else{
			$(".js_counter-"+this.id).removeClass("field-error");
			$(".js_counter-"+this.id).addClass("field-success");
		}
		if(e.type == "blur"){
			if(!$(".js_counter-"+this.id).hasClass("field-error")){
				$(".js_counter-"+this.id).delay(2000).fadeOut("slow");
			}
		}else{
			$(".js_counter-"+this.id).fadeIn();
		}
	});
});