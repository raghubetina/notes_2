class StateMachinesController < ApplicationController
  before_action :set_state_machine, only: [:show, :edit, :update, :destroy]

  # GET /state_machines
  def index
    @q = StateMachine.ransack(params[:q])
    @state_machines = @q.result(:distinct => true).includes(:project).page(params[:page]).per(10)
  end

  # GET /state_machines/1
  def show
  end

  # GET /state_machines/new
  def new
    @state_machine = StateMachine.new
  end

  # GET /state_machines/1/edit
  def edit
  end

  # POST /state_machines
  def create
    @state_machine = StateMachine.new(state_machine_params)

    if @state_machine.save
      message = 'StateMachine was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @state_machine, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /state_machines/1
  def update
    if @state_machine.update(state_machine_params)
      redirect_to @state_machine, notice: 'State machine was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /state_machines/1
  def destroy
    @state_machine.destroy
    message = "StateMachine was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to state_machines_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state_machine
      @state_machine = StateMachine.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def state_machine_params
      params.require(:state_machine).permit(:link_to_diagram, :project_id, :notes, :dsl, :diagram, :table, :column)
    end
end
