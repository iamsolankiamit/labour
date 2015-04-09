class ReportsController < ApplicationController
  def index
    @labour = Labour.where("labours.on_vacation is not true").order(:first_name)
  end
  def long
    @labours = Labour.where("labours.on_vacation is not true")
    if params[:labour]
      @labour = Labour.find(params[:labour][:id])
    else
      @labour = Labour.where("labours.on_vacation is not true").order(:first_name).first
    end
  end
  def client
    @clients = Client.where("clients.on_vacation is not true").order(:first_name)
    @labours = Labour.all.order(:first_name)
    if params[:client]
      @client = Client.find(params[:client][:id])
    else
      @client = Client.where("clients.on_vacation is not true").order(:first_name).first
    end
  end
end
