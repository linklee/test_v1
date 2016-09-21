//on turbolinks load
var ready;
var showAnswerForm = function () {
	$('.new-answer-form').removeClass('hidden');
	$(this).hide();
	return false;
}
ready = function() {
	//show new answer form on click
	console.log('turbolinks loaded');
	$("body").on("click", ".show-answer-link",showAnswerForm);
};

// //on on turbolinks load call ready function (it is calling just once)

$(document).on('turbolinks:load', ready);
