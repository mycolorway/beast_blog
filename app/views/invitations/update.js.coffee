<% if @invitation.errors.any? %>
currentPage.jq.find('.post-form').replaceWith('<%= j render "form", invitation: @invitation %>')
<% else %>
Turbolinks.visit '<%= root_path %>', replace: true
<% end %>
