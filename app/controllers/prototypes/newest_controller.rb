class Prototypes::NewestController < ApplicationController
  def index
    @prototypes = Prototype.order("created_at DESC").includes(:prototype_images)
  end
end
