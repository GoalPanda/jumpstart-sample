class PositionTypesController < ApplicationController
  before_action :set_position_type, only: [:show, :edit, :update, :destroy]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /position_types
  def index
    @pagy, @position_types = pagy(PositionType.sort_by_params(params[:sort], sort_direction))

    # Uncomment to authorize with Pundit
    # authorize @position_types
  end

  # GET /position_types/1 or /position_types/1.json
  def show
  end

  # GET /position_types/new
  def new
    @position_type = PositionType.new

    # Uncomment to authorize with Pundit
    # authorize @position_type
  end

  # GET /position_types/1/edit
  def edit
  end

  # POST /position_types or /position_types.json
  def create
    @position_type = PositionType.new(position_type_params)

    # Uncomment to authorize with Pundit
    # authorize @position_type

    respond_to do |format|
      if @position_type.save
        format.html { redirect_to @position_type, notice: "Position type was successfully created." }
        format.json { render :show, status: :created, location: @position_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @position_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /position_types/1 or /position_types/1.json
  def update
    respond_to do |format|
      if @position_type.update(position_type_params)
        format.html { redirect_to @position_type, notice: "Position type was successfully updated." }
        format.json { render :show, status: :ok, location: @position_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @position_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /position_types/1 or /position_types/1.json
  def destroy
    @position_type.destroy
    respond_to do |format|
      format.html { redirect_to position_types_url, status: :see_other, notice: "Position type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_position_type
    @position_type = PositionType.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @position_type
  rescue ActiveRecord::RecordNotFound
    redirect_to position_types_path
  end

  # Only allow a list of trusted parameters through.
  def position_type_params
    params.require(:position_type).permit(:identificator, :name, :description, :value, :account_id)

    # Uncomment to use Pundit permitted attributes
    # params.require(:position_type).permit(policy(@position_type).permitted_attributes)
  end
end
