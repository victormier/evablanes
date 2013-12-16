# encoding: utf-8

class ProjectCoverPictureUploader < ImageUploader
  version :standard do
    process :set_height => 440
  end

  version :cols_6 do
    process :resize_to_fill => [940, 440]
  end

  version :cols_5 do
    process :resize_to_fill => [780, 440]
  end

  version :cols_4 do
    process :resize_to_fill => [620, 440]
  end

  version :cols_3 do
    process :resize_to_fill => [460, 440]
  end

  version :cols_2 do
    process :resize_to_fill => [300, 440]
  end

  version :cols_1 do
    process :resize_to_fill => [140,440]
  end

  version :mini, :from_version => :standard do
    process :set_largest => [80, 60]
  end
end