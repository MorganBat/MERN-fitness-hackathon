class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :update, :destroy]
  before_action :authenticate_user

  # GET /workouts
  def index
    # Index accesses all of the current user's workouts rather than every workout
    @workouts = current_user.workouts
    # @workouts = Workout.all

    render json: @workouts
  end

  # GET /workouts/1
  def show
    # Only allows the current user to access their own workouts
    if @workout.user_id == current_user.id
      render json: @workout
    else
      # Sends a HTTP 401 'unauthorised'
      head 401
    end
  end

  # POST /workouts
  def create
    @workout = Workout.new(workout_params)

    if @workout.save
      render json: @workout, status: :created, location: @workout
    else
      render json: @workout.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /workouts/1
  def update
    # Only allows a user to modify their own workouts
    if @workout.user_id == current_user.id
      if @workout.update(workout_params)
        render json: @workout
      else
        render json: @workout.errors, status: :unprocessable_entity
      end
    else
      # Sends a HTTP 401 'unauthorised'
      head 401
    end
  end

  # DELETE /workouts/1
  def destroy
    # Only allows a user to delete their own workouts
    if @workout.user_id == current_user.id
      @workout.destroy
    else
      # Sends a HTTP 401 'unauthorised'
       head 401
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = Workout.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def workout_params
      params.require(:workout).permit(:exercises, :date, :user)
    end

end
