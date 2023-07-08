class SocietiesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @societies = Society.all
    render json: @societies
  end

  def show
    @society = Society.find(params[:id])
    render json: @society
  end

  def new
    @society = Society.new
  end

  def create
    @society = Society.new(society_params)
    if @society.save
      render json: @society
    else
      render :new
    end
  end

  def edit
    @society = Society.find(params[:id])
  end

  def update
    @society = Society.find(params[:id])
    if @society.update(society_params)
      render json: @society, notice: 'Society was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @society = Society.find(params[:id])
    @society.destroy
    render json: 'Society was successfully destroyed.'
  end

  private
  def society_params
    params.require(:society).permit(:name, :society_id, :society_type, :address, :buildings_count, :security_available, :parking_available)
  end
end
