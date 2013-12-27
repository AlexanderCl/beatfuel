class UploadController  < ApplicationController

  def create
    post = Mixtape.upload(params[:mp3file], current_user)
    redirect_to user_path(current_user)
  end

end