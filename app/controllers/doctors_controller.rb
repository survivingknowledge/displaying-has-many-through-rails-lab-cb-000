class DoctorsController < ApplicationController
  before_action :set_doctor, only:[:show, :edit, :update, :destroy]

  def index
    @doctors = Doctor.all
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(post_params)

    if @doctor.save
      redirect_to @doctor
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @doctor.update(post_params)
      redirect_to @doctor
    else
      render :edit
    end
  end

  def destroy
  
  end

  private

  def post_params
    params.require(:doctor).permit(:name, :department)
  end

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

end
