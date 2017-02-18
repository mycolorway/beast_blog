<% if @post.errors.any? %>
$(currentPage).find('.post-form').replaceWith('<%= render "form", post: @post %>')
<% else %>
Turbolinks.visit "<%= post_url(@post) %>", replace: true
<% end %>
