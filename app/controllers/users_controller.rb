class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user
  end

  def destroy
  end
end
