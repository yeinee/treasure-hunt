class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.questions.build
    @attachment = Attachment.new
  end

  # GET /posts/1/edit
  def edit
    @attachment = @post.attachments.first
    unless @attachment
      @attachment = Attachment.new
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    # default values for post
    @post.user = current_user
    @post.is_complete = false
    @post.hunter_id = nil

    respond_to do |format|
      if @post.save
        @attachment = Attachment.create(file: params[:attachment][:file], parent: @post)

        format.html { redirect_to @post, notice: '어... 어쩌다보니 떨어뜨렸네!' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        @attachment = Attachment.find params[:attachment][:id]
        unless @attachment
          @attachment = Attachment.new(parent: @post)
        end
        if params[:attachment][:file]
          @attachment.file = params[:attachment][:file]
          @attachment.save
        end

        format.html { redirect_to @post, notice: '흥!' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: '어떻게 됐는지는 나... 나도 몰라!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description)
    end
end
