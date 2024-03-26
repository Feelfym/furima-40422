class UsersController < ApplicationController
  def create
    @user = User.new
    if @user.save
      redirect_to root_path
    else
      render :new, :unprocessable_entity
    end
  end
end
