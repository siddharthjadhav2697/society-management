class VisitorsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @visitors = Visitor.all
    render json: @visitors
  end

  def show
    @visitor = Visitor.find(params[:id])
    render json: @visitor
  end

  def new
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(visitor_params)
    if @visitor.save
      render json: @visitor
    else
      render :plain => @visitor.errors.full_messages, status: :unprocessable_entity
    end
  end

  def edit
    @visitor = Visitor.find(params[:id])
  end

  def update
    @visitor = Visitor.find(params[:id])
  end
  
  def destroy
    @visitor = Visitor.find(params[:id])
    @visitor.destroy
    render json: @visitor
  end

  private
  def visitor_params
    params.require(:visitor).permit(:first_name, :last_name, :email, :gender, :age, :phone_number, :room_number, :floor_number, :society_id, :building_id)
  end
end
