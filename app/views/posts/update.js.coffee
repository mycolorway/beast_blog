<% if @post.errors.any? %>
$(currentPage).find('.post-form').replaceWith('<%= j render "form", post: @post %>')
<% else %>
Turbolinks.visit "<%= post_url(@post) %>", replace: true
<% end %>
