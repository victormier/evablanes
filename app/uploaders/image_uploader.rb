class ImageUploader < BaseUploader
  def extension_white_list
    %w( jpg jpeg gif png )
  end

  # Custom methods
  def set_width(width)
    manipulate! do |img|
      unless img.mime_type.match /gif/
        scale = width.to_f / img['width'].to_f
        new_height = img['height'].to_f * scale
        img.resize("#{width}x#{new_height}")
      end
      img
    end
  end

  def set_height(height)
    manipulate! do |img|
      unless img.mime_type.match /gif/
        scale = height.to_f / img['height'].to_f
        new_width = img['width'].to_f * scale
        img.resize("#{new_width}x#{height}")
      end
      img
    end
  end

  def set_square(side)
    manipulate! do |img|
      img = img['width'] > img['height'] ? set_width(200) : set_height(200)
      img.combine_options do |mogrify|
        mogrify.gravity 'center'
        mogrify.background 'transparent'
        mogrify.extent "#{side}x#{side}"
      end
      img
    end
  end

  def set_largest(width, height)
    ratio = Float(width) / Float(height)
    manipulate! do |img|
      ratio_img = Float(img['width']) / Float(img['height'])
      img = ratio_img >= ratio ? set_width(width) : set_height(height)
    end
  end
end
