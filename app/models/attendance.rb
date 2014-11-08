class Attendance < ActiveRecord::Base
  belongs_to :labour
  belongs_to :work
end
