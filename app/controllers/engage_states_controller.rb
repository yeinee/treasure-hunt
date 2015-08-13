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
