class TweetsController < ApplicationController


  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
    redirect_to '/'



  private
  def tweet_params
    params.require(:tweet).permit(:name, :catchcopy,:concept,:image)
  end
  
end