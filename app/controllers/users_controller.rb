class UsersController < ApplicationController
  
  def index # posts_path
    @user = User.all 
  end
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find_by_email(:email)
  end

  def create
    @user = User.new(params[:user])
    if @user.save
     redirect_to users_path, :notice => "Signed up!"
    else
     render "new"
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update 
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
         redirect_to users_path, :notice => "Gespeichert."
      else
        render "edit"
    end
  end
  
  def destroy 
    @user = User.find(params[:id])
    @user.destroy
      redirect_to users_path, :notice => "Gesperrt."
  end
  
end
