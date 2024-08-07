class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :set_prototype, only: [:edit, :update]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to @prototype
    else
      render :edit
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
    redirect_to root_path,unless @prototype.user == current_user
end
