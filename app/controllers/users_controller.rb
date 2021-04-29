class UsersController < ApplicationController
	before_action :authorize!, except: [:new, :create]
  def new
  	user = User.new
  end

  def create
  	user = User.new(user_params)
  	if user.save!
      session[:user_id] = user.id
  		flash[:success] = "You have registered successfully!"
  		redirect_to '/'
  	else
  		redirect_to '/signup'
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name,:email,:password,:confirm_password,:gender)
  end
end
