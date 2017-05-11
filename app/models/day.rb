class Day < ApplicationRecord

  has_many :posts


  def number_of_posts
    self.posts.count
  end

  def get_posts
    posts = self.posts.to_a
    id = self.id
    ##take position into account
    while posts.count < 7
      ##get posts from previous day
      previous_day_posts = Post.where(day_id: (id - 1))
      sorted_posts = previous_day_posts.sort_by {|post| post.position}

      count = posts.count
      if previous_day_posts != []
        sorted_posts.each do |post|
          post.position = count +=1
          posts.append(post)
        end
      end
      ##chance there are still not enough posts
      id = id - 1
    end
    ##only return first 7 if there are more
    return posts[0, 7]
  end

  def self.today
    return Day.find_by_date(Date.today)
  end


end
