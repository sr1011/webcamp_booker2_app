class UsersController < ApplicationController

  def new
    @booker = Booker.new
  end

  def create
    @user = User.new(user_params)
    @userer.user_id = current_user.id
    @user.save
    flash[:notice] = "successfully"
    redirect_to user_path(user.id)
  end

  def show
    @user = User.find(params[:id])
    @booker = Booker.new
    @bookers = Booker.where(user_id: @user.id)
  end

  def index
    @user = current_user
    @users = User.all
    @booker = Booker.new
    @bookers = Booker.all
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
        render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:notice]="successfully."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
