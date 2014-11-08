class Labour < ActiveRecord::Base
  has_many :attendances
  belongs_to :work
end
