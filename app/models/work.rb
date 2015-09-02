class Work < ActiveRecord::Base
  has_many :attendances
  belongs_to :client

  def with_client_name
    "#{client.first_name} #{client.last_name}"
  end

  def name_with_client_name
    "#{client.first_name} #{client.last_name} - #{self.name}"
  end

  scope :client, -> {joins(:client)}
  scope :client_not_on_vacation, -> {client.where("clients.on_vacation is not true")}
end
