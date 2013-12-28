class AdminsController < ApplicationController

  def index
    if !current_admin
      redirect_to root_path
    end
  end

  def settings
    if !current_admin
      redirect_to root_path
    end
  end

  def show
  end
end
