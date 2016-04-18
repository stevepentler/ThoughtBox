function renderLink(link) {
  $('#links-index').prepend(
     `<div class='link center' link-id=${link.id}>
      <h6 class='title'>${link.title}</h6>
      <h6 class='url'>${link.url}</h6>
      ${viewedStatus(link)}
    </div>`
    )
}