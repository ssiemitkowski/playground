class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to posts_path, :notice => "Logged in!"
    else
     flash.now.alert = "Email oder Passwort sind nicht korrekt."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to posts_path
  end

end
