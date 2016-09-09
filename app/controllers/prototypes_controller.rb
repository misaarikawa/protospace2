class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_prototype, only: [:show, :destroy, :edit, :update]

  def index
    @prototypes = Prototype.all.includes(:prototype_images)
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
    @like = @prototype.likes.find_by(user_id: current_user.id)
    @sub_images = @prototype.prototype_images.sub
  end

  def new
    @prototype = Prototype.new
    @prototype.prototype_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to prototypes_path(@prototype), notice: "新しいプロトタイプを登録しました"
    else
      render 'new'
    end
  end

  def destroy
    if @prototype.user_id == current_user.id
      @prototype.destroy
      redirect_to :root, notice: "プロトタイプを削除しました"
    end
  end

  def edit
    @main_image = @prototype.prototype_images.main.first
    @sub_images = @prototype.set_sub_thumbnails
  end

  def update
    if  @prototype.update(prototype_params)
      redirect_to :root, notice: "プロトタイプを更新しました"
    else
      render 'edit'
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
