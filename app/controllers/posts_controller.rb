class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    # @rand_color = ["rgb(250,245,231)", "rgb(243,207,212)",
    #                "rgb(53,84,106)", "rgb(99,168,199)",
    #                "rgb(169,208,225)", "rgb(229,228,240)"]
    # @rand_color = ["rgb(223,51,51)", "rgb(223,103,223)",
                  # "rgb(34,33,222)", "rgb(51,205,52)"]
    @rand_color = ["rgb(194,229,235)", "rgb(66,180,196)",
                   "rgb(156,202,86)", "rgb(234,145,80)",
                   "rgb(223,105,127)", "rgb(129,120,158)"]
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @user_rating = @post.user.get_user_rating.to_f
    @attachment = @post.attachments.first
    @engaging_users = @post.engage_states.to_a.uniq{|e| e.user_id}
    @reply = Reply.new
    @engage_state = EngageState.new

    # 현재 유저의 문제 풀이 상태 확인
    if user_signed_in?
      concerning_engage_states = current_user.engage_states.where(post: @post).order(:question_number)
      if concerning_engage_states.present?
        @q_num = concerning_engage_states.last.question_number
        @q_num += 1 if concerning_engage_states.last.is_valid
      else
        @q_num = 1
      end
      @current_question = @post.questions.find_by(number: @q_num)
    end

  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.questions.build
    @post.attachments.build
  end

  # GET /posts/1/edit
  def edit
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
      params.require(:post).permit(:title, :description,
                                    questions_attributes: [:content, :answer],
                                    attachments_attributes: [:file])
    end
end
