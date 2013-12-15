# encoding: utf-8

class ProjectCoverPictureUploader < ImageUploader
  version :standard do
    process :set_height => 440
  end

  version :mini, :from_version => :standard do
    process :set_largest => [80, 60]
  end
end