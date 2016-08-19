class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_prototype, only: :show

  def index
    @prototypes = Prototype.all.includes(:prototype_images)
  end

  def show	
  end

  def new
    @prototype = Prototype.new
    @prototype.prototype_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to action: :index, notice: '新しいプロトタイプを登録しました'
    else
      render 'new'
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, prototype_images_attributes: [:id, :content, :status, :_destroy]).merge(user_id: current_user.id)
  end

  def set_prototype
  	@prototype = Prototype.find(params[:id])
  end
end
