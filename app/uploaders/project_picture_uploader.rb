# encoding: utf-8

class ProjectPictureUploader < ImageUploader
  version :full_width do
    process :set_width => 940
  end

  version :mini, :from_version => :full_width do
    process :set_width => 200
  end
end