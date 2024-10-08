class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
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
  
  def create_comment
    @prototype = Prototype.find(params[:id])
    @comment = @prototype.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to prototype_path(@prototype)
    else
      redirect_to prototype_path(@prototype)
    end
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit
    end
  end

  
  


  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype), notice: 'Prototype was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
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

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_prototype
    @prototype = Prototype.find_by(id: params[:id])
    redirect_to root_path unless @prototype
  end

  def correct_user
    redirect_to root_path unless @prototype.user == current_user
  end
end
