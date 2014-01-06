class UploadController  < ApplicationController
  protect_from_forgery :only => [:create]

  def create
    ufile = params[:mp3file]['datafile']
    if ufile.content_type != "mp3" && ufile.content_type != "audio/mp3"
      redirect_to user_path(current_user)
      flash[:error] = 'Onjuist formaat!'
      return
    else
    post = Mixtape.upload(params[:mp3file], current_user)

    redirect_to user_path(current_user)
    flash[:notice] = 'Mixtape succesvol toegevoegd!'
  end
  rescue Exception => ex
    logger.warn('ERROR: ' + ex.message)
    flash.now[:error] = 'Er is een fout opgetreden bij het uploaden van de mixtape'
    redirect_to user_path(current_user)
  end


end