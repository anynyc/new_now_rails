class Post < ApplicationRecord

  belongs_to :day
  validates :body, :headline, :position, :length, :link, :date, presence: true







end
