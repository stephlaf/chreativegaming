class UsersController < ApplicationController
  before_action :set_user
  before_action :authorize_user

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_user
    @user = current_user
  end

  def authorize_user
    authorize @user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar)
  end
end
