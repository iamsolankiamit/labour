class Client < ActiveRecord::Base
  has_many :works
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
