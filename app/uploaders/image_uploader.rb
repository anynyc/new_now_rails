# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick



  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  # #   # For Rails 3.1+ asset pipeline compatibility:
  #   ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.jpg"].compact.join('_'))
  # #
  #   # "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end
  def is_landscape(image)
    file_url = image.file
    img = MiniMagick::Image.open(file_url)
      img_w = img[:width].to_f
      img_h = img[:height].to_f

      if (img_w > img_h)
        true
      else
        false
      end
  end

  # version :slider do
  #   process :make_landscape
  # end

  def create_landscape_version
    img = Magick::Image.read(current_path)
    width = img[0].columns
    height = img[0].rows
    if width > height
      # original is landscape
      # resize_to_fill(738, 492)
      resize_to_fit(400, 600)
      resize_to_fill(600, 273)
    else
      # original is portrait
      resize_to_fit(738, 492)
    end
  end


  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fit => [100, 100]
  end

  version :portrait do
    process :resize_to_fit => [340, 450]
  end

  version :screen do
    process :resize_to_fill => [667, 375]
  end

  version :resize, if: :is_landscape == true do
    resize_to_fit(286, 500)
  end

  version :resize_two, if: :is_landscape == false do
    process :resize_to_fill => [286, 500]
  end




  def my_resize(width, height)
    manipulate! do |img|
      img.resize "#{width}x#{height}!"
      img
    end
  end


  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
