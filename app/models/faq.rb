class Faq < ApplicationRecord
	validates_presence_of :question, :answer

	default_scope { order(:position) }
end
