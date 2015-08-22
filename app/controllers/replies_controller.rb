class RepliesController < ApplicationController
  before_action :set_reply, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  respond_to :html

  def index
    @replies = Reply.all
    respond_with(@replies)
  end

  def show
    respond_with(@reply)
  end

  def new
    @reply = Reply.new
    respond_with(@reply)
  end

  def edit
  end

  def create
    @reply = Reply.new(reply_params)
    @reply.save
    redirect_to :back
  end

  def update
    @reply.update(reply_params)
    respond_with(@reply)
  end

  def destroy
    post_url = "/posts/#{@reply.post_id}"
    @reply.destroy
    respond_to do |format|
      format.html { redirect_to post_url, notice: '꼭... 하고 싶었던 얘긴 아녔어!' }
      format.json { head :no_content }
    end
  end

  private
    def set_reply
      @reply = Reply.find(params[:id])
    end

    def reply_params
      params.require(:reply).permit(:post_id, :user_id, :content)
    end
end
