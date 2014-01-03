class UploadController  < ApplicationController
  protect_from_forgery :only => [:create]

  def create
    post = Mixtape.upload(params[:mp3file], current_user)

    redirect_to user_path(current_user)
    flash[:notice] = 'Mixtape succesvol toegevoegd!'

  rescue Exception => ex
    logger.warn('ERROR: ' + ex.message)
    flash.now[:error] = 'Er is een fout opgetreden bij het uploaden van de mixtape'
    redirect_to user_path(current_user)
  end


end