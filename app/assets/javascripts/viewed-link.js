function viewedLink(status) {
  $('#link-index').delegate(status, 'click', function() {
    debugger
    let $link = $(this).closest('.link');
    let previousState = $idea.find('p').text();
    let newViewState = updatedState(status, previousState);
    let linkParams = {
      link: {viewed: newViewState}
    }
  })
  // viewStatusCall($link, linkParams, newViewState)
}

function viewStatusCall(link, linkParams, newViewState) {
  $.ajax({
    type: "PUT",
    url: `/api/v1/links/${link.attr('link-id')}`,
    data: linkParams,
    success: function() {
      console.log("updated views status")
      link.find('p').innerHTML = newViewState
    },
    error: function(error) {
      console.log(error.responseText);
    }
  })
}

function updatedStatus(status, previousState) {
  console.log(status)
  if (status === true) {
    return `<p>Mark as Unread</p>`
  } else {
    return `<p>Mark as Read</p>`
  }
};

viewedLink('.viewed')