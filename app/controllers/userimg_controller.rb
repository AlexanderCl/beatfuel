class UserimgController < ApplicationController

  def index
    if !current_user
      redirect_to root_path
    end
    @users = User.all
  end


  def destroy
    @user_image = UserImage.find_by_id(params[:id])
    @user_image.destroy

    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.json { head :no_content }
    end
  end


end
