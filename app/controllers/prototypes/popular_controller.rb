class Prototypes::PopularController < ApplicationController
  def index
    @prototypes = Prototype.includes(:prototype_images).order(likes_count: :desc)
  end
end
