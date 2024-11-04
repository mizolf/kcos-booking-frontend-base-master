class SpaceBookingTerm < ApplicationRecord
	STATUS_VALUES = ['pending', 'confirmed', 'declined']

	belongs_to :space_booking

	validates_presence_of :date, :time_from, :time_to
	validate :prevent_terms_overlapping

	default_scope { order(:date, :time_from) }

	scope :not_declined, ->{ where.not(status: 'declined') }
	scope :terms_on, ->(date, time_from, time_to){
		not_declined.where(
			'date = ? AND time_from < ? AND time_to > ?',
			date, time_to, time_from
		)
	}

	def prevent_terms_overlapping
		errors.add(:base, :overlapping) if overlapping?
	end

	def self.taken_intervals(date)
		not_declined.where(date: date).map{ |i| [i.time_from, i.time_to] }
	end

	def interval
		[time_from, time_to]
	end

	def hours_duration
		(time_to - time_from)/60
	end

	def overlapping?
		SpaceBookingTerm.not_declined.where.not(id: self.id).terms_on(self.date, self.time_from, self.time_to).any?
	end

	def status_can_be_changed?
		return false if date < Date.current 
		return true if status != 'declined'
		!overlapping?
	end
end
