class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  include CarrierWave::ImageOptimizer

  # Gets image height, width and aspect ratio
  before :cache, :capture_size_before_cache # callback, example here: http://goo.gl/9VGHI
  def capture_size_before_cache(new_file)
    if model.methods.include?(:image_upload_width) && model.methods.include?(:image_upload_height)
      if (model.image_upload_width.nil? || model.image_upload_height.nil?)
        model.image_upload_width, model.image_upload_height = `identify -format "%wx %h" #{new_file.path}`.split(/x/).map { |dim| dim.to_i }
      end
      if model.methods.include?(:image_upload_ratio) && model.image_upload_ratio.nil?
        model.image_upload_ratio = model.image_upload_width.to_f/model.image_upload_height
      end
    end
  end

  process resize_to_limit: [1920, 10000]

  version :thumb do
    process resize_to_limit: [200, 10000]
  end

  version :medium do
    process resize_to_limit: [800, 10000]
  end

  version :large do
    process resize_to_limit: [1600, 10000]
  end

  # Choose what kind of storage to use for this uploader:
  storage :file
  after :remove, :delete_empty_upstream_dirs
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "#{base_store_dir}/#{model.id}"
  end

  def base_store_dir
    "uploads/images/#{model.class.to_s.underscore}/#{mounted_as}"
  end

  def delete_empty_upstream_dirs
    path = ::File.expand_path(store_dir, root)
    Dir.delete(path) # fails if path not empty dir

    path = ::File.expand_path(base_store_dir, root)
    Dir.delete(path) # fails if path not empty dir
  rescue SystemCallError
    true # nothing, the dir is not empty
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :resize_to_fit => [1920, 10000]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end

end
