class UserBaseController < ApplicationController
  protect_from_forgery with: :exception
  layout "application"
end