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
    @labours = Labour.all
    if params[:client]
      @client = Client.find(params[:client][:id])
    else
      @client = Client.all.first
    end
  end
end
