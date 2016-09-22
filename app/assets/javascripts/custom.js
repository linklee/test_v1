//on turbolinks load
var ready,
	showAnswerForm = function () {
		//remove class hidden from asnwer form
		$('.new-answer-form').removeClass('hidden');
		//remove clicked link
		$(this).addClass('hidden');
					
		return false;
	},
	showEditForm = function () {
		//store this object which = clicked link
		var clickedLink = $(this);

		// get attr from data-answer field
		answerId = clickedLink.attr('data-answer');

		//remove clicked link
		clickedLink.addClass('hidden');

		//remove class hidden
		$('.edit-for-answer-' + answerId).removeClass('hidden');
		return false;
	},
	//update answer = accept edit form
	showAcceptEditForm = function () {
		//store this object which = clicked link
		var clickedLink = $(this);

		// get attr from data-answer field
		answerId = clickedLink.attr('data-answer');

		//remove clicked link
		clickedLink.addClass('hidden');

		//remove class hidden
		$('.accept-edit-' + answerId).removeClass('hidden');
		return false;
	},
	showHightLight = function () {
		//store this object which = clicked link
		console.log('show hightlight');

		var clickedLink = $(this),
			//find nearest answer block
			answer = clickedLink.closest('.answer'),
			//find del or ins element with differ class
			diff = answer.find('.differ');
		//add class to highlight
		diff.addClass('highlight');
		return false;
	},
	hideHightLight = function () {
		//store this object which = clicked link
		console.log('show hightlight');

		var clickedLink = $(this),
			//find nearest answer block
			answer = clickedLink.closest('.answer'),
			//find del or ins element with differ class
			diff = answer.find('.differ');
		//add class to highlight
		diff.removeClass('highlight');
		return false;
	};


ready = function() {
	//show new answer form on click
	console.log('turbolinks loaded');
	$("body").on("click", ".show-answer-link", showAnswerForm);
    $("body").on("click", ".show-edit-link", showEditForm);
    $("body").on("click", ".accept-link",  showAcceptEditForm);
    $(".link-view-addition-changes").hover(showHightLight, hideHightLight);
    
};

// //on on turbolinks load call ready function (it is calling just once)

$(document).on('turbolinks:load', ready);
