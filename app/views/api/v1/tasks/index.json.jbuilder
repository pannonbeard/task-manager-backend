json.tasks @tasks do |task|
  json.id task.id
  json.title task.title
  json.description task.description
  json.priority task.priority
end