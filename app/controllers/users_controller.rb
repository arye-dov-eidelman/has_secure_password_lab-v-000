class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      self.current_user=(@user.id)
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end