function renderLink(link) {
  $('#links-index').prepend(
     `<div class='link center card' link-id=${link.id}>
      <h5 class='title'>${link.title}</h5>
      <p class="viewed btn">${link.viewed}</p>
      <h6 class='url'>${link.url}</h6>
    </div>`
    )
}



