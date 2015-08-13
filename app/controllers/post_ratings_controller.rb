class PostRatingsController < ApplicationController
  before_action :set_post_rating, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @post_ratings = PostRating.all
    respond_with(@post_ratings)
  end

  def show
    respond_with(@post_rating)
  end

  def new
    @post_rating = PostRating.new
    respond_with(@post_rating)
  end

  def edit
  end

  def create
    @post_rating = PostRating.new(post_rating_params)
    @post_rating.save
    respond_with(@post_rating)
  end

  def update
    @post_rating.update(post_rating_params)
    respond_with(@post_rating)
  end

  def destroy
    @post_rating.destroy
    respond_with(@post_rating)
  end

  private
    def set_post_rating
      @post_rating = PostRating.find(params[:id])
    end

    def post_rating_params
      params.require(:post_rating).permit(:post_id, :user_id, :rating)
    end
end
