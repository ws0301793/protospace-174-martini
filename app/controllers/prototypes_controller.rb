class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)
    @prototype.user = current_user
    if @prototype.save
      redirect_to prototype_path(@prototype)
    else
      render :new
    end
  end

  def edit
    @prototype = Prototype.find(params[:id])
    redirect_to prototypes_path
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype), notice: 'Prototype was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @prototype.user == current_user
      @prototype.destroy
      redirect_to prototypes_path
    else
      redirect_to prototypes_path
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:name, :catch_copy, :concept, :user_id, :image)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def correct_user
    unless @prototype.user == current_user
      redirect_to root_path
    end
  end
end
