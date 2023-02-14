class EmployeePositionsController < ApplicationController
  before_action :set_position_group
  before_action :set_employee_position, only: [:show, :edit, :update, :destroy]

  # GET position_groups/1/employee_positions
  def index
    @employee_positions = @position_group.employee_positions
  end

  # GET position_groups/1/employee_positions/1
  def show
  end

  # GET position_groups/1/employee_positions/new
  def new
    @employee_position = @position_group.employee_positions.build
  end

  # GET position_groups/1/employee_positions/1/edit
  def edit
  end

  # POST position_groups/1/employee_positions
  def create
    @employee_position = @position_group.employee_positions.build(employee_position_params)

    if @employee_position.save
      redirect_to([@employee_position.position_group, @employee_position], notice: 'Employee position was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT position_groups/1/employee_positions/1
  def update
    if @employee_position.update_attributes(employee_position_params)
      redirect_to([@employee_position.position_group, @employee_position], notice: 'Employee position was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE position_groups/1/employee_positions/1
  def destroy
    @employee_position.destroy

    redirect_to position_group_employee_positions_url(@position_group)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position_group
      @position_group = PositionGroup.find(params[:position_group_id])
    end

    def set_employee_position
      @employee_position = @position_group.employee_positions.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def employee_position_params
      params.require(:employee_position).permit(:identificator, :group, :positionCategory, :positionClassification, :positionType, :positionCostAuto, :positionCostFixed, :positionCosDefiner, :positionDescriptionAuto, :positionDescriptionFixed, :positionDescriptionDefiner, :positionItem, :positionCost, :position_group_id)
    end
end
