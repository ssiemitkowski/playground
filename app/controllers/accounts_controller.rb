class AccountsController < ApplicationController
  
  def index
    @account = Account.all
  end
  
  def show 
    @account = Account.find(params[:id])
    @user = User.all
  end
  
  def new 
    @account = Account.new
  end
  
  def create 
    @account = Account.new(params[:account])
      if @account.save
        redirect_to accounts_path, :notice => "Der Eintrag wurde gespeichert."
      else
        render "new"
    end
  end
  
  def edit
    @account = Account.find(params[:id])
  end
  
  def update
    @account = Account.find(params[:id])
    if @account.update_attributes(params[:account])
         redirect_to accounts_path, :notice => "Gespeichert."
      else
        render "edit"
    end
  end
  
    def destroy 
    @account = Post.find(params[:id])
    @account.destroy
      redirect_to accounts_path, :notice => "Der Eintrag wurde unwiederruflich aus dem System entfernt."
  end
  
end
