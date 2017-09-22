class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end
  def destroy
  end
  def update
  end

  def create
  	@user = User.create(user_params)
  end
  def edit
  end
  private 

  def user_params
  	params.require(:user).permit(:avatar)
  end

end
