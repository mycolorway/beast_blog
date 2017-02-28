<% if @post.errors.blank? %>
postAutosave = currentPage.jq.find('beast-post-autosave')
postAutosave.get(0)?.lastSaveTime = moment().format()
<% end %>
