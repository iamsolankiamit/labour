class Attendance < ActiveRecord::Base
  belongs_to :labour
  belongs_to :work

  # validates :date, :uniqueness => {:scope => [:labour_id]}
end
