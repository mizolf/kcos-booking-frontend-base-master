module LogActions
  extend ActiveSupport::Concern

	included do
		has_many :action_logs, as: :loggable
		after_save :log_action
		before_destroy :log_destruction
	end

	def log_action
		if Admin.current
			action_logs.create(admin_id: Admin.current.id,
				action: id_changed? ? "created" : "edited",
				params: self.saved_changes.to_json )
		end
	end

	def log_destruction
		if Admin.current
			action_logs.create(admin_id: Admin.current.id,
				action: "destroyed",
				params: self.to_json)
		end
	end

end