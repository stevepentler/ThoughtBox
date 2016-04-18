function editLink(selector) {
  $('#links-index').delegate(selector, 'click', function() {
    var $link = $(this).closest('.link');
    var editableLink = this;
    this.contentEditable = true;

    captureEdit($link, editableLink);
  })
}

function captureEdit(link, editableLink) {
  $(document).keypress(function(event){
    if(event.which == 13) {
      var linkParams = {
        link: {
          title: link.find('.title').text(),
          url: link.find('.url').text()
        }
      };
      callEdit(link, linkParams);
      editableLink.contentEditable = false;
    };
  });
}

function callEdit(link, linkParams) {
  $.ajax({
    type: "PUT",
    url: `/api/v1/links/${link.attr('link-id')}`,
    data: linkParams,
    success: function() {
      console.log("updated link to" + link.find('.title').text())
    },
    error: function(error) {
      console.log(error.responseText);
    }
  });
}