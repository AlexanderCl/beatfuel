class UsermixController < ApplicationController

  def index
    if !current_user
      redirect_to root_path
    end
    @users = User.all
  end

  def destroy
    @user_mixtape = Mixtape.find_by_id(params[:id])
    @user_mixtape.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      flash[:notice] = 'Mixtape verwijderd!'
      format.json { head :no_content }
    end
  end


end
