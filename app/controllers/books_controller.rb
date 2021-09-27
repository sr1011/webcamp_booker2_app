class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
   if @new_book.save
    flash[:notice] = "successfully"
    redirect_to book_path(@new_book)
   else
    @user = current_user
    @books = Book.page(params[:id])
    render :index
   end  
  end

  def index
    @user = current_user
    @new_book = Book.new
    @books = Book.page(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path
    else
      @books = Book.all
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
    flash[:notice] = "successfully"
    redirect_to books_path
    else
      render book_path(current_user)
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
