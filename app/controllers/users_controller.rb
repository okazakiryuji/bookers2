class UsersController < ApplicationController
  def show
    @user =User.find()
    @post_images = @user.post_images
  end

  def index
    @User = User.new
  end

  def create
    user = User.new(user_params)
    user.save
    redirect_to '/users'
  end

  def edit
  end
end
