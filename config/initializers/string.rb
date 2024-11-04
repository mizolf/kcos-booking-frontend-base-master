class String
  def safe_downcase
    self.mb_chars.downcase.strip.normalize
  end

  def api_safe
    self.strip_tags.gsub("&#13;\n", "\n").gsub("&quot;", "'").gsub("&gt;", ">").gsub("&lt;", "<")
  end

  def strip_tags
    ActionController::Base.helpers.strip_tags(self)
  end

  def remove_tag(tag)
    gsub("<#{tag}>", "").gsub("</#{tag}>", "")
  end

  def self.random(length=8)
    chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ0123456789'
    password = ''
    length.times { password << chars[rand(chars.size)] }
    password
  end
end
