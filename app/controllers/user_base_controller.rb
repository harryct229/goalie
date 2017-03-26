class UserBaseController < ApplicationController
  layout "user_layout"
  before_action :check_permisstion 
  def check_permisstion
  	return redirect_to new_user_session_url unless current_user
  end
end
