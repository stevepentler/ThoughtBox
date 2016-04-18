$(document).ready(function(){
  getLinks();
  editLink('.title');
  editLink('.url');
  searchLinks();
  // toggleViewed();
  viewedLink('.viewed');
});