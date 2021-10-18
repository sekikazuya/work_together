class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :search_company, except: [:update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @company = @user.companies
  end

  def search
    @results = @p.result.includes(:user)
  end

  private

  def search_company
    @p = Company.ransack(params[:q])
  end

  def move_to_index
    @user = User.find(params[:id])
    if user_signed_in? && current_user.id != @user.id
      redirect_to root_path
    end
  end

end
