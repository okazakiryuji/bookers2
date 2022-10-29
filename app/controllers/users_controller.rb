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
    user = User.find(params[:id])
    user.update(user_params)
    if user.save
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(user.id)
    else
      @Books = Book.all
      render :index
    end

  end

  def create
    user = User.new(user_params)
    user.save

    redirect_to '/users'
  end

  def _user
    @Book = Book.new
  end

  def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
  end
end
