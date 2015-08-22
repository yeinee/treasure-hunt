class EngageStatesController < ApplicationController
  before_action :set_engage_state, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @engage_states = EngageState.all
    respond_with(@engage_states)
  end

  def show
    respond_with(@engage_state)
  end

  def new
    @engage_state = EngageState.new
    respond_with(@engage_state)
  end

  def edit
    @engage_state.update(answer: params[:answer])
    if @engage_state.answer == @engage_state.post.questions.find_by(number: @engage_state.question_number).answer
      @engage_state.update(is_valid: true)
      next_question = @engage_state.post.questions.find_by(number: @engage_state.question_number + 1)
      if next_question.nil?
        @engage_state.post.update(is_complete: true, hunter: current_user)
        redirect_to "/post_ratings/new"
      else
        next_engage_state = EngageState.new(user: current_user, post: @engage_state.post,
                                            question_number: @engage_state.question_number + 1, answer: "",
                                            is_valid: false)
        next_engage_state.save
        redirect_to "/questions/#{next_question.id}"
      end
    else
      redirect_to :back
    end
  end

  def create
    @engage_state = EngageState.new(engage_state_params)
    @engage_state.save
    respond_with(@engage_state)
  end

  def update
    @engage_state.update(engage_state_params)
    respond_with(@engage_state)
  end

  def destroy
    @engage_state.destroy
    respond_with(@engage_state)
  end

  private
    def set_engage_state
      @engage_state = EngageState.find(params[:id])
    end

    def engage_state_params
      params.require(:engage_state).permit(:user_id, :post_id, :question_number)
    end
end
