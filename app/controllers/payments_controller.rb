class PaymentsController < ApplicationController
  def index
    @labours = Labour.where("labours.on_vacation is not true").order(:first_name)
  end

  def new
  end

  def show
    @labours = Labour.where("labours.on_vacation is not true")
    @labour = Labour.find(params[:id])
  end

  def create
    params[:payment].each do |payment|
      logger.debug(payment[1])
      @payment = Payment.new(payment[1])
      unless @payment.amount_paid.blank?
      @payment.date = Date.strptime(payment[1]["date"],"%d-%m-%Y")
      @payment.save
    end
    end
    respond_to do |format|
      format.html { redirect_to :back , notice: 'payment was successfully created.' }
      format.json { render :show, status: :created, location: @payment }
    end
  end

  def update
  end

  def destroy
    @payment.destroy
    redirect_to payments_url , notice: "Payment has been deleted"
  end
end
