json.extract! post, :link, :body, :headline, :length, :read, :category, :times_shared, :link_text

json.id post.id.to_s
json.image post.image.resize_two.url
