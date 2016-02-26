json.array!(@bugs) do |bug|
  json.extract! bug, :id, :title, :description, :issuetype, :priority, :status
  json.url bug_url(bug, format: :json)
end
