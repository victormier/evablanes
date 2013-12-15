# encoding: utf-8

class SliderPictureUploader < ImageUploader
  version :standard do
    process :resize_to_fill => [940, 417]
  end

  version :mini, :from_version => :standard do
    process :resize_to_fill => [150, 66]
  end
end