<% if @post.errors.any? %>
$(currentPage).find("#<%= dom_id(@post) %>").replaceWith('<%= render "form", post: @post %>')
currentPage.bind()
currentPage.publish.removeAttr 'disabled'
<% else %>
Turbolinks.visit "<%= post_url(@post) %>", replace: true
<% end %>
