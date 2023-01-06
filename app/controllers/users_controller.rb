class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(current_user.id)

  end
 def edit
    user_id = params[:id].to_i
  login_user_id = current_user.id
  if(user_id != login_user_id)
    redirect_to users_path
  end

    @user = User.find(params[:id])
  end
end
