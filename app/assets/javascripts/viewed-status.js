function distinguishLinks() {
  let linksIndex = $('#links-index').children();
  $.each(linksIndex, function(index, link){
    colorLink(link);
  })
}

function colorLink(link) {
  if (link.viewed == "Mark as Read") {
    $(`.${link.id}`).css("color", "red")
  }
}