class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  # GET /attendances
  # GET /attendances.json
  def index
    @attendance = Attendance.new
    if params[:date]
      @date = Date.strptime(params[:date],"%d-%m-%Y")
    else
      @date = Date.today
    end
    @labours = Labour.includes(:attendances).where("labours.on_vacation is not true")
    @todays_attendance = Attendance.where("date = ? ", Date.today)

  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
    @labours = Labour.all
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances
  # POST /attendances.json
  def create
    params[:presence][:attendance].each do |attendance|
      x = attendance[1]
=begin
Attendance.where(date: x["date"], labour_id: x["labour_id"]).first_or_initialize do |a|
        labour = Labour.find(x['labour_id'])
        a.salary = (labour.salary_per_day / labour.salary_for_hours)*(x["hours"].to_f)
        a.hours = x["hours"]
        a.work_id = x["work_id"]
        a.in = x["in"]
        a.out = x["out"]
        a.save
      end
=end
        labour = Labour.find(x['labour_id'])

      Attendance.where({date: x["date"], labour_id: x["labour_id"]}).update_or_create({salary: (labour.salary_per_day / labour.salary_for_hours)*(x["hours"].to_f), hours: x["hours"], work_id: x["work_id"], in: x["in"], out: x["out"]})
    end
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Attendance was successfully created.' }
        #format.json { render :show, status: :created, location: @attendance }
      end
    end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendances_url, notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def change
    @labours = Labour.all
  end

  def bulk
    start = params[:start].to_date
    end_date = params[:end].to_date
    labour = Labour.find(params[:labour][:id])
    work = params[:work][:id]
    presence = params[:presence]
    salary = (labour.salary_per_day / labour.salary_for_hours)*presence.to_f
    start.upto(end_date) do |date|
      a = Attendance.new(labour_id: labour.id, date: date, hours: presence, work_id: work, salary: salary)
      a.save
    end
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:date, :labour_id, :work_id, :hours, :in, :out)
    end
  end
