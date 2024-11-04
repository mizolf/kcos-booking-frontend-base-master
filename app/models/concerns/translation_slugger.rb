module TranslationSlugger
  extend ActiveSupport::Concern

  included do
    before_validation :make_slug

    def make_slug
      slug_without_locales
      slug_with_locales if duplicates_within_translations?
      slug_with_number if duplicates_within_records?
    end

    def slug_with_locales
      eval("#{self.class.name.downcase}_translations.each do |translation|
        translation.slug = translation.slug + '-' + translation.language_id
      end")
    end

    def slug_without_locales
      eval("#{self.class.name.downcase}_translations.each do |translation|
        translation.slug = translation.#{self.slug}.parameterize
      end")
    end

    def slug_with_number
      number = 1
      slugs = hash_translation_slugs
      while duplicates_within_records? do
        eval("#{self.class.name.downcase}_translations.each do |translation|
          translation.slug = slugs[translation.language_id] + '-#{number}'
        end")
        number += 1
      end
    end

    def duplicates_within_translations?
      slugs = eval("#{self.class.name.downcase}_translations.map(&:slug)")
      slugs.uniq.length != slugs.length
    end

    def duplicates_within_records?
      current_translations_ids = eval("#{self.class.name.downcase}_translations.pluck(:id)")
      all_slugs = eval("#{self.class.name}Translation.where.not(id: #{current_translations_ids}).pluck(:slug)")
      slugs = eval("#{self.class.name.downcase}_translations.map(&:slug)")
      (all_slugs & slugs).length > 0
    end

    def hash_translation_slugs
      eval("Hash[#{self.class.name.downcase}_translations.collect { |translation| [translation.language_id, translation.slug] } ]")
    end

    def self.from_param(param)
      begin
        eval("#{self.name}Translation.find_by(slug: '#{param}').#{self.name.downcase}")
      rescue
        raise ActionController::RoutingError.new('Not Found')
      end
    end

  end

end