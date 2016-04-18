function renderLink(link) {
  $('#links-index').prepend(
     `<div class='link center' link-id=${link.id}>
      <h6 class='title'>Title: ${link.title}</h6>
      <h6 class='url'>Link: ${link.url}</h6>
      <p class='viewed'>Viewed: ${link.viewed}</p>
    </div>`
    )
}