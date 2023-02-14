class ActivitiesController < ApplicationController
  before_action :set_component
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  def index
    @pagy, @activities = pagy(Activity.sort_by_params(params[:sort], sort_direction))
    @activities = @component.activities
    # Uncomment to authorize with Pundit
    # authorize @activities
  end

  def show
  end

  def new
    #@activity = Activity.new
    @activity = @component.activities.build
    # Uncomment to authorize with Pundit
    # authorize @activity
  end

  def edit
  end

  def create
    @activity = @component.activities.build(activity_params)
    # Uncomment to authorize with Pundit
    # authorize @activity
    respond_to do |format|
      if @activity.save
        format.html { redirect_to [@activity.component, @activity], notice: "Activity was successfully created." }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @activity.update_attributes(activity_params)
        format.html { redirect_to @activity, notice: "Activity was successfully updated." }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, status: :see_other, notice: "Activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private

  def set_component
    @component = Component.find(params[:component_id])
  end
    
  def set_activity
    @activity = Activity.find(params[:id])
    # Uncomment to authorize with Pundit
    # authorize @activity
  rescue ActiveRecord::RecordNotFound
    redirect_to activities_path
  end

  def activity_params
    params.require(:activity).permit(:name, :code, :description, :budget, :color, :status, :flag, :parent_id, :user_id, :component_id)
    # Uncomment to use Pundit permitted attributes
    # params.require(:activity).permit(policy(@activity).permitted_attributes)
  end
end