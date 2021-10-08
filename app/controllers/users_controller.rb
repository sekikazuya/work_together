class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @company = @user.companies
  end

end
