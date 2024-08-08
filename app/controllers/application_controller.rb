class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_prototype, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :profile, :occupation, :position])
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def correct_user
    unless @prototype.user == current_user
      redirect_to root_path
    end
  end

  def prototype_params
    params.require(:prototype).permit(:name, :catch_copy, :concept, :image)
  end
end
