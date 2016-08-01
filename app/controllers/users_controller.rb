class UsersController < ApplicationController

  before_action :user_info, :authenticate_user!, exept: :show

  def show
     
  end

  def edit

  end

  def update
    if current_user.update(user_params)
       redirect_to action: :show, notice: 'ユーザー情報を変更しました'
    else
       render 'edit'
    end
  end

  private
  def user_info
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :description, :image, :email, :profile, :member_of, :works)
  end
  
end
