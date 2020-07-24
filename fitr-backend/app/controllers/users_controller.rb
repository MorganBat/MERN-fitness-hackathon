class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    # Send a HTTP 401 'unauthorised'
    head 401
  end

  # GET /users/1
  def show
    # Only allows the current user to access their own data
    if @user.id == current_user.id
      render json: @user
    else
      # Sends a HTTP 401 'unathorised'
      head 401
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    # Only allows the current user to modify their own
    if @user.id == current_user.id
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      # Sends a HTTP 401 'unathorised'
      head 401
    end
  end

  # DELETE /users/1
  def destroy
    # Only allows the current user to delete their own account
    if @user.id == current_user.id
      @user.destroy
    else
      # Sends a HTTP 401 'unathorised'
      head 401
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
