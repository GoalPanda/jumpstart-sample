class PositionCategoriesController < ApplicationController
  before_action :set_position_category, only: [:show, :edit, :update, :destroy]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /position_categories
  def index
    @pagy, @position_categories = pagy(PositionCategory.sort_by_params(params[:sort], sort_direction))

    # Uncomment to authorize with Pundit
    # authorize @position_categories
  end

  # GET /position_categories/1 or /position_categories/1.json
  def show
  end

  # GET /position_categories/new
  def new
    @position_category = PositionCategory.new

    # Uncomment to authorize with Pundit
    # authorize @position_category
  end

  # GET /position_categories/1/edit
  def edit
  end

  # POST /position_categories or /position_categories.json
  def create
    @position_category = PositionCategory.new(position_category_params)

    # Uncomment to authorize with Pundit
    # authorize @position_category

    respond_to do |format|
      if @position_category.save
        format.html { redirect_to @position_category, notice: "Position category was successfully created." }
        format.json { render :show, status: :created, location: @position_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @position_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /position_categories/1 or /position_categories/1.json
  def update
    respond_to do |format|
      if @position_category.update(position_category_params)
        format.html { redirect_to @position_category, notice: "Position category was successfully updated." }
        format.json { render :show, status: :ok, location: @position_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @position_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /position_categories/1 or /position_categories/1.json
  def destroy
    @position_category.destroy
    respond_to do |format|
      format.html { redirect_to position_categories_url, status: :see_other, notice: "Position category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_position_category
    @position_category = PositionCategory.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @position_category
  rescue ActiveRecord::RecordNotFound
    redirect_to position_categories_path
  end

  # Only allow a list of trusted parameters through.
  def position_category_params
    params.require(:position_category).permit(:identificator, :name, :description, :value, :account_id)

    # Uncomment to use Pundit permitted attributes
    # params.require(:position_category).permit(policy(@position_category).permitted_attributes)
  end
end
