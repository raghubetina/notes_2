class StateMachinesController < ApplicationController
  before_action :set_state_machine, only: %i[show edit update destroy]

  def index
    @q = StateMachine.ransack(params[:q])
    @state_machines = @q.result(distinct: true).includes(:project).page(params[:page]).per(10)
  end

  def show; end

  def new
    @state_machine = StateMachine.new
  end

  def edit; end

  def create
    @state_machine = StateMachine.new(state_machine_params)

    if @state_machine.save
      message = "StateMachine was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @state_machine, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @state_machine.update(state_machine_params)
      redirect_to @state_machine,
                  notice: "State machine was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @state_machine.destroy
    message = "StateMachine was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to state_machines_url, notice: message
    end
  end

  private

  def set_state_machine
    @state_machine = StateMachine.find(params[:id])
  end

  def state_machine_params
    params.require(:state_machine).permit(:link_to_diagram, :project_id,
                                          :notes, :dsl, :diagram, :table, :column)
  end
end
