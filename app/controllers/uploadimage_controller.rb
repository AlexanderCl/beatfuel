class UploadimageController < ApplicationController


  # GET /users/new
  def new
    @u_image = UserImage.new
  end


  def create
    ufile = params[:imgfile]['datafile']
    if ufile.content_type != "gif" && ufile.content_type != "jpg" && ufile.content_type != "png" && ufile.content_type != "image/png" && ufile.content_type != "image/gif" && ufile.content_type != "image/gif"
      flash[:error] = 'Onjuist formaat!'
      redirect_to user_path(current_user)
      return
    else
      post = UserImage.uploadimage(params[:imgfile], current_user)
      redirect_to user_path(current_user)
      flash[:notice] = 'Afbeelding succesvol toegevoegd!'
    end
  end

end
