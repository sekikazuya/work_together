class IquiriesController < ApplicationController
  before_action :search_company, except: [:update, :destroy]

  def index
    @iquiry = Iquiry.new
    @room = Room.find(params[:room_id])
    @iquiries = @room.iquiries.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
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

end
