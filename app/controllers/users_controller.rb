class UsersController < ApplicationController
  def show
    @user =User.find(params[:id])
    @users = User.all
    @books = @user.books
    @Book = Book.new
    @book = Book.all

  end

  def index
    @User = User.new
    @users = User.all
    @Book = Book.new
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end

  end

  def create
    user = User.new(user_params)
    user.save

    redirect_to '/users'
  end

  def _user
    @Book = Book.new
    @users = User.all
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :introduction,:image)
  end
  
  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
end
