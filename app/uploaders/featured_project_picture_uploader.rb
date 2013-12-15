# encoding: utf-8

class FeaturedProjectPictureUploader < ImageUploader
  version :standard do
    process :resize_to_fill => [300, 227]
  end

  version :mini, :from_version => :standard do
    process :resize_to_fill => [60, 45]
  end
end