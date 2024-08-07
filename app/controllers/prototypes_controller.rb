class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :edit, :update, :destroy, :index, :show]
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = @prototype.comments.build
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)
    if @prototype.save
      if params[:comment]
        @prototype.comments.create(comment_params.merge(user: current_user))
      end
      redirect_to prototype_path(@prototype)
    else
      render :new
    end
  end
  
  def edit
    @prototype = Prototype.find(params[:id])
      redirect_to root_path unless current_user == @prototype.user
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit
    end
  end

  
  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to prototypes_path
  end


  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def correct_user
    redirect_to root_path unless current_user == @prototype.user
  end


  def prototype_params
    params.require(:prototype).permit(:name, :catch_copy, :concept, :user_id, :image)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
