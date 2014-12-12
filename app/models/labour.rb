class Labour < ActiveRecord::Base
  has_many :attendances
  belongs_to :work

  def name_with_salary
    "#{self.first_name} #{self.last_name} - #{self.salary_per_day}"
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
