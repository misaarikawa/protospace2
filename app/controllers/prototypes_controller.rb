class PrototypesController < ApplicationController

	def new
		# @user = User.find(params[:user_id])
		@prototype = Prototype.new
	end

	def create
		Prototype.create(create_params)
		redirect_to action: :index
	end

  private
  def create_params
    params.require(:prototype).permit(:title, :catch_copy, :concept).merge(user_id: current_user.id)
  end
end
