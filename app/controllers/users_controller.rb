class UsersController < ApplicationController

  def show
    
  end

  def edit
    
  end

  def update
    current_user.update(user_params)
  end

  preivate

  def user_params
    params.require(:user).permit(:name, :email, :password, :company, :occupation, :position)
  end

end
