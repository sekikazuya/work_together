class IquiriesController < ApplicationController
  before_action :authenticate_user!
  before_action :search_company, except: [:update, :destroy]
  before_action :set_room, only: [:index, :create]

  def index
    @iquiry = Iquiry.new
    @iquiries = @room.iquiries.includes(:user)
  end

  def create
    @iquiry = @room.iquiries.new(iquiry_params)
    if @iquiry.save
      redirect_to room_iquiries_path(@room)
    else
      @iquiries = @room.iquiries.includes(:user)
      render :index
    end
  end

  def search
    @results = @p.result.includes(:user)
  end

  private

  def search_company
    @p = Company.ransack(params[:q])
  end

  def iquiry_params
    params.require(:iquiry).permit(:message, :image).merge(user_id: current_user.id)
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

end
