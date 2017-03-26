class UserBaseController < ApplicationController
  layout "user_layout"
  before_action :check_permission
  def check_permission
  	return redirect_to new_user_session_url unless current_user
  end
end
