class Attendance < ActiveRecord::Base
  belongs_to :labour
  belongs_to :work

  validates :date, :uniqueness => {:scope => [:labour_id]}

def self.update_or_create(attributes)
  assign_or_new(attributes).save
end

def self.assign_or_new(attributes)
  obj = first || new
  obj.assign_attributes(attributes)
  obj
end

end
