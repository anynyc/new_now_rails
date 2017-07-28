class Post < ApplicationRecord

  belongs_to :day
  validates :body, :position, :length, :link, :date, :image, :category, presence: true

  mount_uploader :image, ImageUploader

  before_save :upcase_link_text


  def upcase_link_text
    self.link_text = self.link_text.upcase
    self.category = self.category.upcase
  end



end
