class LegalPage < ApplicationRecord
  validates_length_of :name, maximum: 30
  validates_presence_of :name, :slug
  validates_uniqueness_of :slug

  default_scope { order(:position) }
  scope :listed, ->{ where(list: true) }

  extend FriendlyId
  friendly_id :name, use: :history

  def resolve_seo_title
    return seo_title unless seo_title.blank?
    return name
  end

  def resolve_seo_description
    return seo_description unless seo_description.blank?
    return content.strip_tags.truncate(150, divider: ' ')
  end
end
