class BuildingsController < ApplicationController
  skip_before_action :verify_authenticity_token 
  def index
    @buildings = Building.all
    render json: @buildings
  end

  def show
    @building = Building.find(params[:id])
    render json: @building
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)
    if @building.save
      render json: @building
    else
      render :plain => @building.errors.full_messages, status: :unprocessable_entity
    end
  end

  def edit
    @building = Building.find(params[:id])
  end

  def update
    @building = Building.find(params[:id])
    if @building.update(building_params)
      render json: @building
    else
      render :plain => @building.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @building = Building.find(params[:id])
    @building.destroy
    render plain: 'Building was successfully destroyed.'
  end

  private
  def building_params
    params.require(:building).permit(:name, :building_id, :floor_count, :room_count, :no_of_residents, :society_id)
  end

  def society_params
    params.require(:society).permit(:society_id)
  end
end
