class Prototypes::PopularController < ApplicationController
  def index
    @prototypes = Prototype.includes(:user).order(likes_count: :desc)
  end
end
