class UsersController < UserBaseController

  # GET /users/1
  # GET /users/1.json
  def show
    @goals = current_user.goals.active
    @group = current_user.groups
  end

 
  private
end
