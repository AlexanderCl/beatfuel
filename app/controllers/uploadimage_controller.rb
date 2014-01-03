class UploadimageController < ApplicationController


  # GET /users/new
  def new
    @u_image = UserImage.new
  end


  def create
    post = UserImage.uploadimage(params[:imgfile], current_user)
    redirect_to user_path(current_user)
    flash[:notice] = 'Afbeelding succesvol toegevoegd!'
  end

end
