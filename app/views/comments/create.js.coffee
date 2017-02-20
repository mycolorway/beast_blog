<% if @comment.errors.any? %>
currentPage.jq.find('.comment-form').replaceWith('<%= j render "form", post: @post %>')
<% else %>
currentPage.commentInput.clear()
currentPage.commentList.addComment $('<%= j render "comment", comment: @comment %>')
currentPage.commentList.updateCommentCount <%= @post.comments.size %>
<% end %>
