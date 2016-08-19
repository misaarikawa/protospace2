class UsersController < ApplicationController

  before_action :set_user, only: :show
  before_action :authenticate_user!, only: :edit

  def show
    @prototypes = @user.prototypes
  end

  def edit
    set_user.image.cache! unless set_user.image.blank?
  end

  def update
    if current_user.update(user_params)
       redirect_to action: :show, notice: 'ユーザー情報を更新しました'
    else
       render 'edit'
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :description, :image, :email, :profile, :member_of, :works)
  end
  
end
