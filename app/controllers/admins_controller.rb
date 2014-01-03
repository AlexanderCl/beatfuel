class AdminsController < ApplicationController

  def index
    if !current_admin
      redirect_to root_path
    end
    @users = User.all
  end

  def mixtapes
    if !current_admin
      redirect_to root_path
    end
    @users = User.all
    respond_to do |format|
      format.html { render 'admins/mixtapes' }
      format.json { head :no_content }
    end
  end

  def images
    if !current_admin
      redirect_to root_path
    end
    @users = User.all
    respond_to do |format|
      format.html { render 'admins/images' }
      format.json { head :no_content }
    end
  end

  def destroy
    @mixtape = Mixtape.find_by_id(params[:id])
    @mixtape.destroy

    respond_to do |format|
      format.html { redirect_to mixtapes_admins_path }
      flash[:notice] = 'Mixtape verwijderd!'
      format.json { head :no_content }
    end
  end

  def show
  end
end
