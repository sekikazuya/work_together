class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @company = @user.company
  end

  def edit
    
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :company, :occupation, :position)
  end

end
