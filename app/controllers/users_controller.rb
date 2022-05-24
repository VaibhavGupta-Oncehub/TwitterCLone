class UsersController < ApplicationController
  before_action :authenticate_user! 

  def show
    @user= User.find(params[:id])

    if @user === nil
      flash.now[:alert] = "You should be logged in to view your profile."
      redirect_to root_path
    end
  end

  

end
