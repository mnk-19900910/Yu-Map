json.array! @posts do |post|
  json.id post.id
  json.name post.name
  json.location post.location
  json.imgage post.image
  json.user_id post.user_id
  json.name post.user.name
  json.user_sign_in current_user
end