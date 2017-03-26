require 'pry'
class UsersController < UserBaseController

  # GET /users/1
  # GET /users/1.json
  def show
    user = User.find(params[:id])
    @is_my_page = user.id == current_user.id
    @goals = user.goals.active
    @group = user.groups
    @late_goal = Goal.lazy_goal(user.id)
  end

 
  private
end
