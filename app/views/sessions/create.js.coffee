<% if @session.errors.any? %>
currentPage.jq.find(".login-form")
  .replaceWith('<%= render "form", session: @session %>')
<% else %>
Turbolinks.visit '<%= @redirect_url %>'
<% end %>
