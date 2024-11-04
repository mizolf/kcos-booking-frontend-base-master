class Admin < ApplicationRecord
  before_validation :create_identicon
  before_save :detect_password_change
  after_initialize :initialize_permissions#, if: :new_record?
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  has_many :resource_permissions, dependent: :destroy
  accepts_nested_attributes_for :resource_permissions
  mount_base64_uploader :image, ImageUploader
  has_many :contact_message_reads, dependent: :destroy
  has_many :action_logs
  validates_presence_of :first_name, :last_name

  def create_identicon
    self.image = Identicon.data_url_for "#{self.email}", 256, [240,240,240] if self.image.blank?
  end

  def full_name
  	"#{first_name} #{last_name}"
  end

# Forcing initial admin pass change
  def detect_password_change
    self.pass_changed = DateTime.now if changed.include? 'encrypted_password'
  end

  def pass_changed?
    (self.superadmin || self.pass_changed > self.created_at)
  end

  def restricted_resources
    [ "admin_accounts", "contact_messages" ]
  end

  def initialize_permissions
    restricted_resources.each do |resource|
      self.resource_permissions.build(resource: resource) unless resource_permissions.map(&:resource).include?(resource)
    end
  end

  def moderator?
    !admin && !superadmin
  end

  def permitted?(resource)
    return true if superadmin || admin
  begin
    resource_permissions.find_by(resource: resource).permitted
  rescue
    false
  end
  end

  def permissions
    moderator? ? resource_permissions.where(permitted: true).map(&:resource) : "unlimited"
  end

  def log_permissions
    permissions_list = resource_permissions.where(permitted: true).map{|permission| permission.resource.singularize.camelize }
  end

  def unread_messages
    ContactMessage.where('created_at > ?', self.created_at).unread_by(self)
  end

  def self.current
    Thread.current[:admin]
  end

  def self.current=(admin)
    Thread.current[:admin] = admin
  end

end