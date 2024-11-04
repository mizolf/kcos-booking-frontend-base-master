class GalleryImage < ApplicationRecord
	mount_base64_uploader :image, ImageUploader
	default_scope { order(:position) }
end