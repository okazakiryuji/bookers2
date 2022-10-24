class UsersController < ApplicationController
  def show
    @user =User.find(params[:id])
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
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  def create
    user = User.new(user_params)
    user.save

    redirect_to '/users'
  end



  def user_params
    params.require(:user).permit(:title, :body,:image)
  end
end
