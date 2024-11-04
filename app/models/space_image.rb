class SpaceImage < ApplicationRecord
	mount_base64_uploader :image, ImageUploader
	belongs_to :space

	default_scope { order(:position) }

end
