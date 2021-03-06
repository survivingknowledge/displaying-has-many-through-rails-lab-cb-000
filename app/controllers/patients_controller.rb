class PatientsController < ApplicationController
  before_action :set_patient, only:[:show, :edit, :update, :destroy]

  def index
    @patients = Patient.all
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(post_params)

    if @patient.save
      redirect_to @patient
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update(post_params)
      redirect_to @patient
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def post_params
    params.require(:patient).permit(:name, :age)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end

end
