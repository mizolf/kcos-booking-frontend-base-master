function show_modal(modal_class=""){
	$("body").addClass("modal--opened");
	$("#modal").attr("class", "modal " + modal_class);
}

function close_modal(){
	if(document.hasFocus()){
		$("body").removeClass("modal--opened");
	}
}

function inject_in_modal(content, modal_class=""){
	$("#modal-injected_content").html(content);
	show_modal(modal_class);
}