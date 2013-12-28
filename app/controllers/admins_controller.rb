class AdminsController < ApplicationController

  def index
    @users = User.all
    if !current_admin
      redirect_to root_path
    end
  end

  def settings
    if !current_admin
      redirect_to root_path
    end
  end

  def mixtapes
    @users = User.all
    if !current_admin
      redirect_to root_path
    end
  end

  def deleteTape(mixtape)
    @mixtape = Mixtape.find_by(mixtape)
    @mixtape.destroy

    if !current_admin
      redirect_to root_path
    end
  end

  def show
  end
end
