class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @user.user_information.build
    @user.assets.build
    #5 keer het veld zien om afbeelding toe te voegen doe je zo
    5.times {@user.assets.build}
  end

  # GET /users/1/edit
  def edit
   #5 keer het veld zien om afbeelding toe te voegen doe je zo
   @user.assets.build
   5.times {@user.assets.build}
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params) ?
        redirect_to(user_path(@user)) : render(action: 'edit')
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      nested_keys_info = params.require(:user).fetch(:user_information_attributes, {}).keys
      nested_keys_assets = params.require(:user).fetch(:assets_attributes, {}).keys
      params.require(:user).permit(:name,:user_information_attributes => nested_keys_info,:assets_attributes => nested_keys_assets)
    end
end
