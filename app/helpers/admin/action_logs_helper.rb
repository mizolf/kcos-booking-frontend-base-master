module Admin::ActionLogsHelper

  def last_log(object)
    action_log = object.action_logs.last
    "#{action_log.created_at.strftime("%d/%m/%Y")}: #{action_log.admin.full_name} - #{t(action_log.action)}"
  end

  def log_object(log)
    if log.loggable_id.nil?
      ("<span class='deleted'>"+t("deleted_#{log.loggable_type.underscore}")+"</span>").html_safe
    else
      resource_log_link(log)
    end
  end

  def log_admin(log)
    if log.admin_id.nil?
      "<span class='deleted'>#{t('deleted_admin')}</span>".html_safe
    else
      link_to log.admin.full_name, [:admin, log.admin], class: "link"
    end
  end

  def resource_log_link(log)
    case log.loggable_type
    when "ContactInfo"
      link_to t("resources.#{log.loggable_type.underscore}"), admin_contact_infos_path, class: "link"
    else
      link_to t("resources.#{log.loggable_type.underscore}"), [:admin, log.loggable], class: "link"
    end
  end

  def action_log_class(action)
    case action
    when "created"
      "indicator indicator--green"
    when "destroyed"
      "indicator indicator--red"
    when "edited"
      "indicator indicator--orange"
    end
  end

end