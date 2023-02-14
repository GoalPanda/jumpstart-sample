class PositionClassificationsController < ApplicationController
  before_action :set_position_classification, only: [:show, :edit, :update, :destroy]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /position_classifications
  def index
    @pagy, @position_classifications = pagy(PositionClassification.sort_by_params(params[:sort], sort_direction))

    # Uncomment to authorize with Pundit
    # authorize @position_classifications
  end

  # GET /position_classifications/1 or /position_classifications/1.json
  def show
  end

  # GET /position_classifications/new
  def new
    @position_classification = PositionClassification.new

    # Uncomment to authorize with Pundit
    # authorize @position_classification
  end

  # GET /position_classifications/1/edit
  def edit
  end

  # POST /position_classifications or /position_classifications.json
  def create
    @position_classification = PositionClassification.new(position_classification_params)

    # Uncomment to authorize with Pundit
    # authorize @position_classification

    respond_to do |format|
      if @position_classification.save
        format.html { redirect_to @position_classification, notice: "Position classification was successfully created." }
        format.json { render :show, status: :created, location: @position_classification }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @position_classification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /position_classifications/1 or /position_classifications/1.json
  def update
    respond_to do |format|
      if @position_classification.update(position_classification_params)
        format.html { redirect_to @position_classification, notice: "Position classification was successfully updated." }
        format.json { render :show, status: :ok, location: @position_classification }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @position_classification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /position_classifications/1 or /position_classifications/1.json
  def destroy
    @position_classification.destroy
    respond_to do |format|
      format.html { redirect_to position_classifications_url, status: :see_other, notice: "Position classification was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_position_classification
    @position_classification = PositionClassification.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @position_classification
  rescue ActiveRecord::RecordNotFound
    redirect_to position_classifications_path
  end

  # Only allow a list of trusted parameters through.
  def position_classification_params
    params.require(:position_classification).permit(:identificator, :name, :description, :value, :account_id)

    # Uncomment to use Pundit permitted attributes
    # params.require(:position_classification).permit(policy(@position_classification).permitted_attributes)
  end
end
