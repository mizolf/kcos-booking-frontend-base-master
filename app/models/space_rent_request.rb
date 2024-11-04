class SpaceRentRequest < ApplicationRecord
  attr_accessor :consent

	before_create :set_token
  validates_uniqueness_of :token
  validates_presence_of :first_name, :last_name, :organisation, :phone, :email, :people_count, :work_plan, :work_goal
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, allow_blank: true

  belongs_to :space

  default_scope { order(created_at: :desc) }
  scope :unread, ->{ where(seen_at: nil) }

  def full_name
    "#{first_name} #{last_name}"
  end

  def set_token
    self.token = generate_token
  end

  def generate_token
    token = SecureRandom.urlsafe_base64
    SpaceRentRequest.exists?(token: token) ? generate_token : token
  end
end
