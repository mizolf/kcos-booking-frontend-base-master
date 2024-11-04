class Document < ApplicationRecord
	mount_uploader :file, DocumentUploader
	validates_presence_of :name, :file

	default_scope { order(:position) }

end
