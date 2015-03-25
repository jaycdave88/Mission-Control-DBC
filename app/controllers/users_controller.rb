class UsersController < ApplicationController

	def index
	end

	def new
		@user = User.new
    render partial: 'new'
	end

	def create
		@user = User.new(params.require(:user).permit(:name, :email, :phase, :password))
    if @user.save
      flash[:notice] = "Signed up!"
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "Something went wrong."
      redirect_to root_path
    end
	end


	def show
		@user= User.find(params[:id])
    @stickies = @user.stickies
	end

end

