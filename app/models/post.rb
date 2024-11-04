class Post < ApplicationRecord
	mount_uploader :seo_image, ImageUploader
	mount_uploader :image, ImageUploader

	validates_presence_of :title, :summary, :image, :seo_keywords
	validates_length_of :seo_description, maximum: 150
  validates_uniqueness_of :slug

  before_save :parameterize_slug

  scope :visible,       ->(allow_previews=false){ allow_previews ? all : where('publish_at <= ?', Date.today).where(preview: false) }
  scope :unpublished,   ->{ Post.where.not(id: visible.ids) }

  extend FriendlyId
  friendly_id :title, use: :history

  def published?
    publish_at <= Date.today && !preview
  end

  def parameterize_slug
    self.slug = self.slug&.mb_chars.parameterize
  end

  def resolve_image_alt
    image_alt.blank? ? title : image_alt 
  end

  def resolve_seo_title
    return seo_title unless seo_title.blank?
    return title
  end

  def resolve_seo_image
    return seo_image_url unless seo_image.blank?
    return image_url(:medium)
  end

  def resolve_seo_description
    return seo_description unless seo_description.blank?
    return summary.truncate(150, divider: ' ')
  end
end
