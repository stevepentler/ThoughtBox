function getIdeas() {
  $.getJSON('/api/v1/links', function(links) {
    $.each(links, function(index, link) {
      renderLink(link);
    })
  })
}