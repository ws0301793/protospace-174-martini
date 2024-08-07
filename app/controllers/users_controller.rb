class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes
  end
end
