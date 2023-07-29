class SessionsController < ApplicationController
  def index; end

  def new
    reset_session
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      flash[:success] = "Hello #{@user.username}"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:danger] = "Email or Password was incorrect"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
