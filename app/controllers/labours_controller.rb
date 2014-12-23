class LaboursController < ApplicationController
  before_action :set_labour, only: [:show, :edit, :update, :destroy]

  # GET /labours
  # GET /labours.json
  def index
    @labours = Labour.all
  end

  # GET /labours/1
  # GET /labours/1.json
  def show
  end

  # GET /labours/new
  def new
    @labour = Labour.new
    @works = Work.all
  end

  # GET /labours/1/edit
  def edit
    @works = Work.all
  end

  # POST /labours
  # POST /labours.json
  def create
    @labour = Labour.new(labour_params)

    respond_to do |format|
      if @labour.save
        format.html { redirect_to @labour, notice: 'Labour was successfully created.' }
        format.json { render :show, status: :created, location: @labour }
      else
        format.html { render :new }
        format.json { render json: @labour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labours/1
  # PATCH/PUT /labours/1.json
  def update
    respond_to do |format|
      if @labour.update(labour_params)
        format.html { redirect_to @labour, notice: 'Labour was successfully updated.' }
        format.json { render :show, status: :ok, location: @labour }
      else
        format.html { render :edit }
        format.json { render json: @labour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labours/1
  # DELETE /labours/1.json
  def destroy
    @labour.destroy
    respond_to do |format|
      format.html { redirect_to labours_url, notice: 'Labour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def salary
    @labours = Labour.all
  end

  def bs
    start = params[:start].to_date
    end_date = params[:end].to_date
    labour = Labour.find(params[:labour][:id])
    labour.salary_per_day = params[:salary_per_day]
    labour.save!
    start.upto(end_date) do |date|
      a = Attendance.where(labour_id: labour.id, date: date).first
      unless a.nil?
      salary = (labour.salary_per_day / labour.salary_for_hours)*a.hours
      a.salary = salary
      a.update!(labour_id: labour.id, date: date, salary: salary)
    end
    end
    redirect_to :back
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labour
      @labour = Labour.includes(:work).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def labour_params
      params.require(:labour).permit(:first_name, :last_name, :phone_no, :date_of_joining,:account, :salary_per_day, :salary_for_hours, :on_vacation, :has_left, :work_id,:account_setteled_on)
    end
  end
