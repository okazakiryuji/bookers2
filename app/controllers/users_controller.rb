class UsersController < ApplicationController
  def show
    @user =
    @post_images = @user.post_images
  end

  def edit
  end
end
