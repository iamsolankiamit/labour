class Labour < ActiveRecord::Base
  has_many :attendances
  belongs_to :work

  # validates_uniqueness_of :full_name

  def name_with_salary
    "#{self.first_name} #{self.last_name} - #{self.salary_per_day}"
  end

  def name_with_client_salary
    "#{self.first_name} #{self.last_name} - #{self.client_salary}"
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
