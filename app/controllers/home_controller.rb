class HomeController < ApplicationController
  def index
    if params.fetch(:s,'p') == 'p'
      cookies[:s] = 'p'
    elsif params.fetch(:s) == 'c'
      cookies[:s] ='c'
    end
  end
end
