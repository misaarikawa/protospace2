class PrototypesController < ApplicationController

    def index
    	@prototypes = Prototype.all
    end

    def show
    	@prototype = Prototype.find(params[:id])
    end

	def new
		@prototype = Prototype.new
		@prototype.prototype_images.build
	end

	def create
		Prototype.create(create_params)
		redirect_to action: :index
	end

  private
  def create_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, prototype_images_attributes: [:id, :prototype_id, :content, :status]).merge(user_id: current_user.id)
  end
end
