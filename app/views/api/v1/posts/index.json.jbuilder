json.posts do
  json.array! @posts, partial: 'api/v1/posts/post', as: :post, locals: {post: @post}
end
