<% if @session.errors.present? %>
$(currentPage).find("#<%= dom_id(@session) %>").replaceWith('<%= render "form", session: @session %>')
<% else %>
Turbolinks.visit window.location
<% end %>
