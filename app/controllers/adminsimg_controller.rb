class AdminsimgController < ApplicationController

  def index
    if !current_admin
      redirect_to root_path
    end
    @users = User.all
  end


  def destroy
    @user_image = UserImage.find_by_id(params[:id])
    @user_image.destroy

    respond_to do |format|
      format.html { redirect_to images_admins_path }
      format.json { head :no_content }
    end
  end


end
