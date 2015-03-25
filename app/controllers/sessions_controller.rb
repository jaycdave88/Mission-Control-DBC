class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged In"
      redirect_to user
    else
      flash[:notice] = "Invalid email or password"
        redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged Out"
    redirect_to root_url
  end

  def status
    if session[:user_id]
      render json: {logged: true, user_id: session[:user_id]}
    else
      render json: {logged: false}
    end
  end

end
