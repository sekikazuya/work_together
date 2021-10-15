class RoomsController < ApplicationController
  before_action :search_company, except: [:update, :destroy]

  def index
    @room = Room.all
  end

  def new
    @room = Room.new
    @company = Company.find(params[:company_id])
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_path(@room.id)
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  def search
    @results = @p.result.includes(:user)
  end

  private

  def search_company
    @p = Company.ransack(params[:q])
  end

  def room_params
    params.require(:room).permit(:title, user_ids: []).merge(company_id: params[:company_id])
  end

end
