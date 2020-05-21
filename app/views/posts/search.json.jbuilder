json.array! @posts do |post|
  json.name post.name
  json.location post.location
  json.user_id post.user_id
  json.id post.id
  json.user_name post.user.name
end