class UsersController < ApplicationController
  before_action :set_user
  before_action :authorize_user, except: [:index]

  def index
    @users = policy_scope(User).all if current_user.master == true
    # @users = policy_scope(User).search_by_all_fields(params[:query])
  end

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
    @user.destroy
    redirect_to users_path
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
