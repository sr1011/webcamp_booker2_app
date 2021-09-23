class UsersController < ApplicationController
  before_action :authenticate_user!
     #(ログインしていない状態で他のページに遷移しようとした場合、ログインページに繊維する)
     before_action :ensure_current_user, {only: [:edit,:update,:destroy]}
     #(ログインユーザー以外の情報を遷移しようとした時に制限をかける)
     
  def new
    @booker = Booker.new
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
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully."
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
