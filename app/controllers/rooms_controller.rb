class RoomsController < ApplicationController
  before_action :search_company, except: [:update, :destroy]

  def new
    @room = Room.new
    @company = Company.find(params[:company_id])
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
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
