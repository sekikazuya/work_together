class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :search_company, except: [:update, :destroy]

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

end
