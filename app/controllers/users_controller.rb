class UsersController < UserBaseController

  # GET /users/1
  # GET /users/1.json
  def show
    user = User.find(params[:id])
    @goals = user.goals.active
    @group = user.groups
  end

 
  private
end
