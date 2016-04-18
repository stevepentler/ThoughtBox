function renderLink(link) {
  $('.links').prepend(
    `<div class='link center' link-id=${link.id}>
      <h3 class='title'> ${link.title}</h3>
      <h3 class='url'> ${link.url}</h3>
      <h4 class='viewed'> ${link.viewed}</h4>
    </div>`
    )
}