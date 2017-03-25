require 'pry'
class ActivitiesController < UserBaseController
  before_action :set_activity, only: [:show, :new, :edit, :update, :destroy]

  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create
    if params[:goal_id].blank? || params[:activity][:quantity].blank?
        return redirect_to(user_path current_user)
    end
    @activity = Activity.new
    @activity.user_id = current_user.id
    @activity.goal_id = params[:goal_id]
    @activity.quantity = params[:activity][:quantity]
    respond_to do |format|
      if @activity.save
        format.html { redirect_to "#{ user_goal_activities_path(current_user) }/#{@activity.id}", notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to "#{ user_goal_activities_path(current_user) }/#{@activity.id}", notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @goal = Goal.find(params[:goal_id])
      @activity = Activity.find(params[:id]) if params[:id] 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.fetch(:activity, {})
    end
end
