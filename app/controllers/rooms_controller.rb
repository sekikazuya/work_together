class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :search_company, except: [:update, :destroy]
  before_action :set_room, only: [:show, :destroy]

  def index
    @room = Room.all
  end

  def new
    @room = Room.new
    @company = Company.find(params[:company_id])
  end

  def create
    @room = Room.new(room_params)
    @company = Company.find(params[:company_id])
    if @room.save
      redirect_to room_path(@room.id)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @room.destroy
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

  def set_room
    @room = Room.find(params[:id])
  end

end
