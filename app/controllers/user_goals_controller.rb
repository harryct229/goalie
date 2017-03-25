class UserGoalsController < UserBaseController
  before_action :authenticate_user!

  def new
    @user_goal = UserGoal.new
  end

  def create
    @user_goal = UserGoal.new(user_goal_params)
    @user_goal.owner = current_user

    if @user_goal.save
      redirect_to current_user, notice: "Successfully create new goal"
    else
      render 'new'
    end
  end
  
  private

  def user_goal_params
    params.require(:user_goal).permit(:description, :target, :deadline)
  end
end
