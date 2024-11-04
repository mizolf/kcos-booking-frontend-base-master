module ApplicationHelper

  def file_icon(ext)
  	render("/shared/file.svg", ext: ext)
  end

  def tf(field)
    t('activerecord.attributes.'+field)
  end

  def external_url(link)
    # this method will add http if missing
    # use: <%= link_to 'Google', external_url('www.osijek031.com'), target: "_blank" %>
    if link =~ /http/
      link
    else
      "http://#{link}"
    end
  end


end