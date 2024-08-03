class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: 'Prototype was successfully created.'
    else
      render :new
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:name, :catch_copy, :concept, :image)
  end
end
