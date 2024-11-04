module Admin::AdminsHelper

  def admins_role(admin)
  	return "Superadmin" if admin.superadmin
  	return "Admin" if admin.admin
  	"Moderator"
  end

  def permission_to_edit(admin)
    (current_admin.superadmin && !admin.superadmin) || (current_admin.admin && admin.moderator?)
  end

  def permission_to_delete(admin)
    (current_admin.superadmin && !admin.superadmin) || (current_admin.admin && admin.moderator?)
  end

  def boolean_indicator(boolean=nil)
    inline_svg 'icons/circle.svg', class: "boolean-indicator #{ "boolean-indicator--#{boolean}" unless boolean.nil?}"
  end

  def nav_indicator(options={})
    return nil if options[:unread] == 0
    options[:unread] = "+9" if options[:unread] > 9
    "<span id='#{options[:id]}' class='unread-indicator #{options[:class]}'>#{options[:unread]}</span>".html_safe
  end

end