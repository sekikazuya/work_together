class RoomsController < ApplicationController
  before_action :search_company, except: [:update, :destroy]

  def new
    @room = Room.new
  end

  def search
    @results = @p.result.includes(:user)
  end

  private

  def search_company
    @p = Company.ransack(params[:q])
  end

end
