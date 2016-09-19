class Prototypes::NewestController < ApplicationController
  def index
    @prototypes = Prototype.includes(:users).order("created_at DESC")
  end
end
