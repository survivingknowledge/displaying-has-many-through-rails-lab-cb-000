class AppointmentsController < ApplicationController
  before_action :set_appointment, only:[:show, :edit, :update, :destroy]


  def show
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(post_params)

    if @appointment.save
      redirect_to @appointment
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @appointment.update(post_params)
      redirect_to @appointment
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def post_params
    params.require(:appointment).permit(:appointment_datetime, :doctor_id, :patient_id)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
end
