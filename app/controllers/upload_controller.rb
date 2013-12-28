class UploadController  < ApplicationController
  protect_from_forgery :only => [:create, :update, :destroy]

  def create
    post = Mixtape.upload(params[:mp3file], current_user)
    redirect_to user_path(current_user)
  end

end