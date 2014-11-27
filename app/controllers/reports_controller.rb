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
end
