module SeoHelper
  # Why?
  # Imagine, you have been working on a project for 3 months and you have to reduce the length of the SEO description on ALL pages.
  # Change it in 5 sec by changing it in seo_description method
  #
  # Example for  app/views/news_items/show.html.erb:
  # 
  # <!-- SEO -->
  #<% content_for :title, "#{@news_item.translate.title} | #{Seo.default[I18n.locale][:title]}" %>
  #<% content_for :description, seo_description(@news_item.translate.description) %>
  #<% content_for :image, seo_image(@news_item) %>
  #<% content_for :keywords, seo_keywords(@news_item.translate.keywords) %>

  def seo_image(target, field="image")
    # will return SEO image path (string)
    # use: <%= seo_image(@news_item) %> 
    # or   <%= seo_image(@news_item, 'custom_image') %> 
    begin
      return target.public_send("#{field}_url", :medium)
    rescue
      nil
    end
  end

  def seo_description(desc)
    # will return SEO description (string) without tags and max 150 in length
    # use: <%= seo_description(@news_item.description) %> 
    truncate(strip_tags(desc), length: 150 ) unless desc.blank?
  end

  def seo_keywords(keywords)
    # will return SEO keywords (string)
    # use: <%= seo_keywords( @news_item.tags.pluck(:title).join(', ') ) %> 
    keywords unless keywords.blank?
  end

  def resolve_image_alt(image)
    image.image_alt.blank? ? "#{AppInfo.name} #{t('image')} #{image.position.to_i + 1}" : image.image_alt
  end
end