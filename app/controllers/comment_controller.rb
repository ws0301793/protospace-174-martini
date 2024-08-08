class Comment < ApplicationRecord
  before_action :authenticate_user!

  belongs_to :user
  belongs_to :prototype

  validates :content, presence: true

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to prototype_path(@prototype)
    else
      redirect_to prototype_path(@prototype)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
