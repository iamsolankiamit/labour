class ReportsController < ApplicationController
  def index
    @labour = Labour.all.order(:first_name)
  end
  def long
    @labours = Labour.all
    if params[:labour]
      @labour = Labour.find(params[:labour][:id])
    else
      @labour = Labour.all.order(:first_name).first
    end
  end
  def client
    @clients = Client.all.order(:first_name)
    @labours = Labour.all.order(:first_name)
    if params[:client]
      @client = Client.find(params[:client][:id])
    else
      @client = Client.all.order(:first_name).first
    end
  end
end
