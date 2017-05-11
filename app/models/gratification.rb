class Gratification < ApplicationRecord

    validates :message, :keyword, :image, :alternate_message, presence: true

    mount_uploader :image, ImageUploader

end
