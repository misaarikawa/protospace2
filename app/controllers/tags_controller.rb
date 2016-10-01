class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.most_used.where("name not ?", nil)
  end

  def show
    @tag =  ActsAsTaggableOn::Tag.where(params[:tag_name])
    @prototypes = Prototype.tagged_with(@tag.name)
  end
end
