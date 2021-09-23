class BookersController < ApplicationController
  
  def new
    @booker = Booker.new
  end
  
  def show
    @booker = Booker.find(params[:id])
  end

  def edit
    @booker = Booker.find(params[:id])
  end
  
  def create
    @booker = Booker.new(booker_params)
    @booker.user_id = current_user.id
    @booker.save
    flash[:notice] = "successfully"
    redirect_to bookers_path
  end
  
  def index
    @bookers = Booker.page(params[:id])
  end
  
  def update
    booker = Booker.find(params[:id])
    booker.update(booker_params)
    flash[:notice] = "successfully"
    redirect_to booker_path
  end
  
  def destroy
    booker = Booker.find(params[:id])
    booker.destroy
    flash[:notice] = "successfully"
    redirect_to bookers_path
  end
  
  private
  def booker_params
    params.require(:booker).permit(:book_name, :caption)
  end
  
end
