class UsersController < ApplicationController
  def show
    @user =User.find()
    @post_images = @user.post_images
  end

  def index
  end

  def edit
  end
end
