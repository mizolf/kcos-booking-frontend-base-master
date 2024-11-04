class SpaceBooking < ApplicationRecord
	attr_accessor :validation_step, :consent

	has_many :space_booking_terms, dependent: :destroy
	accepts_nested_attributes_for :space_booking_terms, allow_destroy: true

  belongs_to :space

	before_create :set_token

  validates_uniqueness_of :token

  scope :finished, ->{ where(finished: true) }
  scope :unread,   ->{ finished.where(seen_at: nil) }

  def set_token
    self.token = generate_token
  end

  def generate_token
    token = SecureRandom.urlsafe_base64
    SpaceBooking.exists?(token: token) ? generate_token : token
  end

  with_options if: :validate_general_step? do |o|
    o.validates :first_name, :last_name, :organisation, :phone, :email, :people_count, :purpose, presence: true
    o.validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, allow_blank: true
  end

  with_options if: :validate_dates_step? do |o|
    o.validate :at_least_one_term
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def status
    return :outdated if outdated?
    return :new if seen_at.nil?
    return :pending if pending?
    return :partially_pending if partially_pending?
    return :resolved if resolved?
  end

  def outdated?
    !space_booking_terms.map{ |t| t.date < Date.today }.include?(false)
  end

  def pending?
    space_booking_terms.map(&:status).uniq == ['pending']
  end

  def partially_pending?
    'pending'.in?(space_booking_terms.map(&:status)) && !pending?
  end

  def resolved?
    space_booking_terms.where(status: 'pending').blank?
  end

  def at_least_one_term
    errors.add(:base, :at_least_one_term) unless space_booking_terms.any?
  end

  def validate_general_step?
  	self.validation_step.to_s == 'general'
  end

  def validate_dates_step?
    self.validation_step.to_s == 'dates'
  end

  def any_status_changes?
    space_booking_terms.map{ |t| t.status == t.last_status_seen }.include?(false)
  end

  def update_seen_statuses
    space_booking_terms.find_each{ |t| t.update_column(:last_status_seen, t.status) }
    update_column(:last_status_seen_updated_at, DateTime.current)
  end
end
