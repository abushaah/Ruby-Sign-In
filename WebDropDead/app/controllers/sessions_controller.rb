class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:action_type] == "sign_up"
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)  # sign into user page
      else
        render 'new'  # re-render the form for sign-up fail
      end
    else  # sign in
      @user = User.find_by(email: params[:user][:email])

      if @user.nil?  # user doesn't exist
        flash.now[:error] = "User not found. Please sign up."
        render 'new'
      elsif @user.password != params[:user][:password]  # user exist, password incorrect
        flash.now[:error] = "Incorrect password."
        render 'new'
      else
        session[:user_id] = @user.id
        redirect_to user_path(@user)  # sign into user page
      end
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to new_session_path # back to sign in page
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
