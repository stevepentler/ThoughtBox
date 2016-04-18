function viewedLink(status) {
  $('#links-index').delegate(status, 'click', function() {
    let $link = $(this).closest('.link');
    let previousState = $(this).closest('.link').find('p').text()
    let newViewState = updatedStatus(previousState);
    let linkParams = {
      link: {viewed: newViewState}
    }
  viewStatusCall($link, linkParams, newViewState)
  });
}

function viewStatusCall(link, linkParams, newViewState) {
  $.ajax({
    type: "PUT",
    url: `/api/v1/links/${link.attr('link-id')}`,
    data: linkParams,
    success: function() {
      link.find('p').text(newViewState);
    },
    error: function(error) {
      console.log(error.responseText);
    }
  })
}

function updatedStatus(previousState) {
  if (previousState === "Mark as Unread") {
    return `Mark as Read`
  } else {
    return `Mark as Unread`
  }
};
