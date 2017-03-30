json.extract! post, :link, :body, :headline, :length, :read, :category, :times_shared

json.id post.id.to_s
json.image post.image.screen.url
