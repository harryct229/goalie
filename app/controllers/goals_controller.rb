class GoalsController < UserBaseController
  before_action :set_goal, only: [:show]

  # GET /goals/1
  # GET /goals/1.json
  def show
    @activities = @goal.activities
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end
end
