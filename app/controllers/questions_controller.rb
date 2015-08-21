class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @questions = Question.all
    respond_with(@questions)
  end

  def show
    @engage_state = current_user.engage_states.find_by(post_id: @question.post_id,
                                                       question_number: @question.number)
    unless @engage_state.present?
      @engage_state = EngageState.new(user: current_user, post: @question.post,
                                      question_number: @question.number, answer: "",
                                      is_valid: false)
      @engage_state.save
    end
    respond_with(@question)
  end

  def new
    @question = Question.new
    respond_with(@question)
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    @question.save
    respond_with(@question)
  end

  def update
    @question.update(question_params)
    respond_with(@question)
  end

  def destroy
    @question.destroy
    respond_with(@question)
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:post_id, :number, :content, :answer)
    end
end
