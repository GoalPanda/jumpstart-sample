class ComponentsController < ApplicationController
  before_action :set_project
  before_action :set_component, only: [:show, :edit, :update, :destroy]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  def index
    @pagy, @components = pagy(Component.sort_by_params(params[:sort], sort_direction))
    @components = @project.components
    # Uncomment to authorize with Pundit
    # authorize @components
  end

  def show
  end

  def new
    #@component = Component.new
    @component = @project.components.build
    # Uncomment to authorize with Pundit
    # authorize @component
  end

  def edit
  end

  def create
    @component = @project.components.build(component_params)
    # Uncomment to authorize with Pundit
    # authorize @component
    respond_to do |format|
      if @component.save
        format.html { redirect_to [@component.project, @component], notice: "Component was successfully created." }
        format.json { render :show, status: :created, location: @component }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @component.update_attributes(component_params)
        format.html { redirect_to @component, notice: "Component was successfully updated." }
        format.json { render :show, status: :ok, location: @component }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @component.destroy
    respond_to do |format|
      format.html { redirect_to project_components_url(@project), status: :see_other, notice: "Component was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_component
    #@component = Component.find(params[:id])
    @component = @project.components.find(params[:id])
    # Uncomment to authorize with Pundit
    # authorize @component
  rescue ActiveRecord::RecordNotFound
    redirect_to components_path
  end

  def component_params
    params.require(:component).permit(:name, :code, :description, :budget, :color, :status, :flag, :parent_id, :user_id, :project_id)
    # Uncomment to use Pundit permitted attributes
    # params.require(:component).permit(policy(@component).permitted_attributes)
  end
end