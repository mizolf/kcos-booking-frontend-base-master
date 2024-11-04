module Admin::ImageSizeHelper

  def image_height_validator(class_name)
    eval("#{class_name.singularize.capitalize}.validators_on(:image_upload_height).first.options[:greater_than_or_equal_to]")
  end

  def image_width_validator(class_name)
    eval("#{class_name.singularize.capitalize}.validators_on(:image_upload_width).first.options[:greater_than_or_equal_to]")
  end

  def image_validator(class_name)
    "#{image_width_validator(class_name)}x#{image_height_validator(class_name)}"
  end

end