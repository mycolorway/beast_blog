currentPage.commentList.removeComment '#<%= dom_id @comment %>', ->
  currentPage.commentList.updateCommentCount <%= @comment.post.comments.size %>
