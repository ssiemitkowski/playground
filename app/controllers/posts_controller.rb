class PostsController < ApplicationController
                     
  def index # posts_path
    @post = Post.all
  end
  
  def show # post_path - einen individuellen post_path anzeigen
    @post = Post.find(params[:id])
  end
  
  def new # new_post_path - Formular, um einen neuen Post zu erstellen
    @post = Post.new
  end
  
  def create # kein Pfad - kein View - nur Prozess - übernimmt die vom New-Formular übergebenen Daten und übermittelt diese zur Datenbank
    @post = Post.new(params[:post])
      if @post.save
        redirect_to posts_path, :notice => "Der Eintrag wurde gespeichert."
      else
        render "new"
    end
  end
  
  def edit # edit_post_path - Formular Daten aus der Datenbank zu ändern
    @post = Post.find(params[:id])
  end
  
  def update # kein View - nur Prozess - kein Pfad - übernimmt die vom Edit-Formular übergebenen Daten und übermittelt diese zur Datenbank
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
         redirect_to posts_path, :notice => "Gespeichert."
      else
        render "edit"
    end
  end
  
  def destroy # kein View - nur Prozess - kein Pfad - löscht Daten aus der Datenbank
    @post = Post.find(params[:id])
    @post.destroy
      redirect_to posts_path, :notice => "Gesperrt."
  end
  
end
