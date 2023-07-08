class ResidentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @residents = Resident.all
    render json: @residents
  end

  def show
    @resident = Resident.find(params[:id])
    render json: @resident
  end

  def new
    @resident = Resident.new
  end

  def create
    @resident = Resident.new(resident_params)
    if @resident.save
      render json: @resident
    else
      render :plain => @resident.errors.full_messages, status: :unprocessable_entity
    end
  end

  def edit
    @resident = Resident.find(params[:id])
  end

  def update
    @resident = Resident.find(params[:id])
    if @resident.update(resident_params)
      render json: @resident
    else
      render :plain => @resident.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @resident = Resident.find(params[:id])
    @resident.destroy
    render plain: 'Resident was successfully destroyed.'
  end

  private
  def resident_params
    params.require(:resident).permit(:first_name, :last_name, :email, :gender, :age, :phone_number, :room_number, :floor_number, :society_id, :building_id)
  end
end
