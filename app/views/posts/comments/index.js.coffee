<% if @comments.any? %>
  currentPage.addComments $('<%= render "posts/comments", post: @post, comments: @comments %>')
<% else %>
  currentPage.noMoreComments()
<% end %>
