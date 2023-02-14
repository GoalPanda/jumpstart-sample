class PositionGroupsController < ApplicationController
  before_action :set_position_group, only: [:show, :edit, :update, :destroy]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /position_groups
  def index
    @pagy, @position_groups = pagy(PositionGroup.sort_by_params(params[:sort], sort_direction))

    # Uncomment to authorize with Pundit
    # authorize @position_groups
  end

  # GET /position_groups/1 or /position_groups/1.json
  def show
  end

  # GET /position_groups/new
  def new
    @position_group = PositionGroup.new

    # Uncomment to authorize with Pundit
    # authorize @position_group
  end

  # GET /position_groups/1/edit
  def edit
  end

  # POST /position_groups or /position_groups.json
  def create
    @position_group = PositionGroup.new(position_group_params)

    # Uncomment to authorize with Pundit
    # authorize @position_group

    respond_to do |format|
      if @position_group.save
        format.html { redirect_to @position_group, notice: "Position group was successfully created." }
        format.json { render :show, status: :created, location: @position_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @position_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /position_groups/1 or /position_groups/1.json
  def update
    respond_to do |format|
      if @position_group.update(position_group_params)
        format.html { redirect_to @position_group, notice: "Position group was successfully updated." }
        format.json { render :show, status: :ok, location: @position_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @position_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /position_groups/1 or /position_groups/1.json
  def destroy
    @position_group.destroy
    respond_to do |format|
      format.html { redirect_to position_groups_url, status: :see_other, notice: "Position group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_position_group
    @position_group = PositionGroup.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @position_group
  rescue ActiveRecord::RecordNotFound
    redirect_to position_groups_path
  end

  # Only allow a list of trusted parameters through.
  def position_group_params
    params.require(:position_group).permit(:identificator, :name, :description, :value, :account_id)

    # Uncomment to use Pundit permitted attributes
    # params.require(:position_group).permit(policy(@position_group).permitted_attributes)
  end
end
