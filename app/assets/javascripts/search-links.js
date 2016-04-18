function searchLinks() {
  $("#search").on('keyup', function() {
    let entry = $(this).val().toLowerCase();
    let linksIndex = $('#links-index').children();
    console.log(linksIndex)
    searchEntry(linksIndex, entry);
  });
}

function searchEntry(linksIndex, entry) {
  $.each(linksIndex, function(index, link){
    let title = $(link).find('.title').text().toLowerCase();
    let url = $(link).find('.url').text().toLowerCase();
    let viewed = $(link).find('.viewed').text().toLowerCase();
    showLinks(link, title, url, viewed, entry);
  });
}

function showLinks(link, title, url, viewed, entry) {
  if (title.includes(entry) || url.includes(entry) || viewed.includes(entry)) {
    $(link).show();
  } else {
    $(link).hide();
  }
}