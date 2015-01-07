$(document).ready(function() {
	$( ".post-content .post-slider-wrapper" ).each(function( index ) {
		autoHeight = $(this).css('height', 'auto').height();
		if (autoHeight > 102){
			$(this).css('height', '102px')
		}
		else{
			$(".read-more-post").eq(index).hide();
		}
	  console.log( $(this).height() );
	  console.log( $(".read-more-post").get(1) );
	});

	$(".read-more-post").click(function(){
	    $box = $(("#post-" + this.id) + ' .post-slider-wrapper');

	    minimumHeight = 103;

	    // get current height
	    currentHeight = $box.height();

	    // get height with auto applied
	    autoHeight = $box.css('height', 'auto').height();

	    console.log($(this.id));
	    console.log($box);
	    console.log(autoHeight);
	    console.log(currentHeight);
	    

	    // reset height and revert to original if current and auto are equal
	    $box.css('height', currentHeight).animate({
	        height: (currentHeight > 103 ? minimumHeight : autoHeight)
	    })
	    // $score.css('height', currentHeight).animate({
	    //     height: (currentHeight > 40 ? 40 : autoHeight)
	    // })


	    console.log(autoHeight);
	    console.log(currentHeight);


	    // $(this).animate({
	    //     marginTop: (currentHeight > 40 ? 0 : (autoHeight > 39 ? autoHeight - 40 : 0))
	    // })

	    $(this).text() === 'Read More ▼' ? $(this).text('Minimize ▲') : $(this).text('Read More ▼');
	});
});