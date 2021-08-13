class StateMachinesController < ApplicationController
  before_action :set_state_machine, only: [:show, :edit, :update, :destroy]

  # GET /state_machines
  def index
    @state_machines = StateMachine.all
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
      redirect_to @state_machine, notice: 'State machine was successfully created.'
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
    redirect_to state_machines_url, notice: 'State machine was successfully destroyed.'
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
