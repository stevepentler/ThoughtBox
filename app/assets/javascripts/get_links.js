function getLinks() {
  $.getJSON('/api/v1/links', function(links) {
    $.each(links, function(index, link) {
      colorLink(link);
      renderLink(link);
    })
  })
}