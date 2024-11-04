class ResourcePermission < ApplicationRecord
	belongs_to :admin
	validates_uniqueness_of :admin_id, scope: :resource
end
