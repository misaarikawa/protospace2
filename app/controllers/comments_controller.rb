class CommentsController < ApplicationController
  before_action :set_prototype, only: :create

  def create
    @prototype.comments.create(comment_params)
    @comments = Comment.where(prototype_id: params[:prototype_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:article).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
