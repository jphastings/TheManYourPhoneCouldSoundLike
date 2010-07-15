$(document).ready(function() {
	$('#number').keydown(function(e) {
		if ((e.keyCode < 48 || e.keyCode > 57) && (e.keyCode != 32 && e.keyCode != 189 && e.keyCode != 8)) {
			e.preventDefault()
		}
	})
	
	$('form a').click(function(e) {
		e.preventDefault()
		$(this).fadeOut('fast',function() {
			var next = $(this).next()
			if (next.attr('href') == undefined) {
				next = $(this).siblings().first()
			}
			next.fadeIn()
			
			
			
			$(this).parent().children('input').attr('value',next.attr('href').substr(1))
			
			
			sex_check(next.attr('class'))
		})
	})
	
	$('form input[type="radio"]').bind('change',function() {
		sex_check($(this).parent().attr('class'))
	})
})

function sex_check(sex) {
	$('form a').removeClass('wrongsex')
	switch(sex) {
		case 'male':
			$('form li[class="female"]').fadeOut()
			$('form li[class="male"]').fadeIn()
			$('form a[class="female"]').addClass('wrongsex')
			break;
		case 'female':
			$('form li[class="female"]').fadeIn()
			$('form li[class="male"]').fadeOut()
			$('form a[class="male"]').addClass('wrongsex')
			break;
		case 'neutral':
			$('form li').fadeIn()
	}
}