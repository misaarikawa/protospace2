class UsersController < ApplicationController

  def show
    @name = current_user.name
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if 
      current_user.update(update_params)
      redirect_to action: :show, notice: 'マイページを更新しました'
    else
      render 'edit'
    end
  end

  private
  def update_params
    params.require(:user).permit(:name, :description, :image, :email, :profile, :member_of, :works)
  end

  private
  def user_params
    params.require(:user).permit(:name, :description, :image)
  end
  
end
