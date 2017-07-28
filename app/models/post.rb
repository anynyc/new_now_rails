class Post < ApplicationRecord

  belongs_to :day
  validates :body, :position, :link, :date, :image, :category, presence: true

  mount_uploader :image, ImageUploader

  before_save :upcase_link_text

  before_save :fill_ins


  def upcase_link_text
    self.link_text = self.link_text.upcase
    self.category = self.category.upcase
  end

  def fill_ins
    self.headline = "headline filler"
    self.length = "1"
  end



end
