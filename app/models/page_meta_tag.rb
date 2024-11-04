class PageMetaTag < ApplicationRecord
	mount_uploader :image, ImageUploader

	validates_uniqueness_of :page
	validates_presence_of :title, :description, :keywords
	validates_length_of :title, maximum: 20
	validates_length_of :description, maximum: 150

	def resolve_og_title
		og_title.blank? ? title : og_title
	end
end
