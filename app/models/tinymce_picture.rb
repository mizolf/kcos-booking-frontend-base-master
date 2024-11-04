class TinymcePicture < ApplicationRecord
  mount_uploader :file, ImageUploader
end