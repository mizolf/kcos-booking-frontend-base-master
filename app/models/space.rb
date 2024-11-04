class Space < ApplicationRecord
	validates_presence_of :name, :surface_area, :description

  has_many :space_images, dependent: :destroy
  accepts_nested_attributes_for :space_images, allow_destroy: true

  has_many :space_bookings
  has_many :space_rent_requests

	monetize :book_price_cents
	monetize :rent_price_cents

	def featured_image
		space_images.first
	end

	def rent_options
		options = []
		options += ['monthly'] if rentable
		options += ['hourly'] if bookable
		options
	end

	def to_param
		"#{id}-#{name.mb_chars.parameterize}"
	end
end
