class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  attr_accessor :destroyed
  after_destroy :mark_as_destroyed

  def mark_as_destroyed
    self.destroyed = true
  end
end
