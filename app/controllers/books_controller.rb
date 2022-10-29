class BooksController < ApplicationController
  def new
  end

  def show
    @Book = Book.new
    @books = Book.all
    @book = Book.find(params[:id])
    @users = User.all
  end

  def index
    @Book = Book.new
    @Books = Book.all

  end

  def edit
    @Book = Book.new
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(book.id)
    else
      @books = Book.all
      @users = User.all
      @book = Book.find(params[:id])
      render :show
    end
  end

  def create
    @Book = Book.new(book_params)
    @Book.user_id = current_user.id
    if @Book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@Book.id)
    else
      @Books = Book.all
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def book_params
    params.require(:book).permit(:title, :body,:image)
  end
end
