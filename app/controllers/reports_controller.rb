class ReportsController < ApplicationController
  def index
    @labour = Labour.all
  end
  def long
    @labours = Labour.all
    if params[:labour]
      @labour = Labour.find(params[:labour][:id])
    else
      @labour = Labour.all.first
    end
  end
  def client
    @clients = Client.all
    if params[:client]
      @client = Client.find(params[:client][:id])
      @labours = Labour.includes(:work).where("labour.work.client_id = ?", @client.id).all
    else
      @client = Client.all.first
      @labours = Labour.includes(:work).where("labour.work.client_id = ?", @client.id).all
    end
  end
end
