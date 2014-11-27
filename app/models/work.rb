class Work < ActiveRecord::Base
  has_many :attendances
  belongs_to :client

  def with_client_name
    "#{client.first_name} #{client.last_name}"
  end
end
