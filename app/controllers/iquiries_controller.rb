class IquiriesController < ApplicationController

  def index
    @iquiry = Iquiry.new
    @room = Room.find(params[:room_id])
    @iquiries = @room.iquiries.includes(:user)
  end

end
