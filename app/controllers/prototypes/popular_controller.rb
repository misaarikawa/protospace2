class Prototypes::PopularController < ApplicationController
  def index
    @prototypes = Prototype.includes(:users).order(likes_count: :desc)
  end
end
