json.extract! post, :link, :body, :headline, :length, :read, :category, :times_shared, :link_text, :r_value, :g_value, :b_value, :a_value

json.id post.id.to_s
json.image post.image.resize_two.url
