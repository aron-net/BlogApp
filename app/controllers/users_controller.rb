class UsersController < ApplicationController
  
  before_action :authenticate_user_admin!
  protect_from_forgery prepend: true
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
