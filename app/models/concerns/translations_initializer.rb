module TranslationsInitializer
  extend ActiveSupport::Concern

  included do
    after_initialize :initialize_translations, if: :new_record?
  end

  def initialize_translations
    I18n.available_locales.each do |locale|
      self.translations.build(language_id: locale) unless self.translations.map(&:language_id).include?(locale.to_s)
    end
  end

  def translations
    send("#{self.class.name.underscore}_translations")
  end

  def translate(locale=I18n.locale)
    translations = send("#{self.model_name.param_key}_translations")
    translations.find_by(language_id: locale.to_s)
  end
end