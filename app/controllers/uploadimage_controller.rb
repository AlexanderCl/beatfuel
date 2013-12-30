class UploadimageController < ApplicationController

  def create
    post = UserImage.uploadimage(params[:imgfile], current_user)
    redirect_to user_path(current_user)
  end

end
