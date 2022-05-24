class TweetsController < ApplicationController 
  before_action :authenticate_user! 
  def index
    @tweets = current_user.tweets;
  end

   def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new({title: tweet_params[:title], description: tweet_params[:description], user_id: tweet_params[:user_id]})

    if @tweet.save
      flash[:notice] =" Tweet was successfully created."
      redirect_to @tweet
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @tweet= Tweet.find(params[:id]);
  end
  
   def edit
    @tweet = Tweet.find(params[:id])
  end
   def update
    @tweet = Tweet.find(params[:id])

    if @tweet.update(tweet_params)
      flash[:notice]=" Tweet ws have been updated successfully."
      redirect_to @tweet

    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])   
    
    @tweet.destroy
    flash[:notice] =" Tweet was successfully destroyed."
    
    redirect_to user_path(current_user), status: :see_other
  end

   private
    def tweet_params
      params.require(:tweet).permit(:title, :description,:user_id)
    end
end
