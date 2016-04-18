function viewedStatus(link) {
  if (link.viewed) {
    console.log("view mark as unread visible")
    return `<p>Mark as Unread</p>`
  } else {
    return `<p>Mark as Read</p>`
  }
};