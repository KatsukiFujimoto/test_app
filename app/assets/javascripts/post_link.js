$.fn.show_post_detail = function() {
  this.each(function() {
    var post_list = $(this);
    var post_link = post_list.data('link');

    post_list.on('click', function(e) {
      var target = e.target;

      if (target.classList.contains('post-list')) {
        window.location.href = post_link;
      };
    })
  })
}

$('.post-list').show_post_detail();