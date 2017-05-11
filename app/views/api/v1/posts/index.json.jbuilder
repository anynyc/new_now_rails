json.posts do
  json.array! @posts, partial: 'api/v1/posts/post', as: :post, locals: {post: @post}
end

json.gratification do
  json.id @gratification.id.to_s
  json.message @gratification.message
  json.alternate_message @gratification.alternate_message
  json.keyword @gratification.keyword
  json.image @gratification.image.resize_two.url
  json.button_label @gratification.button_label
  json.title @gratification.title
end
