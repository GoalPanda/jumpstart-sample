class PostsController < ApplicationController
  before_action :set_project
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @pagy, @posts = pagy(Post.sort_by_params(params[:sort], sort_direction))
    @posts = @project.posts
    # Uncomment to authorize with Pundit
    # authorize @posts
  end

  def show
  end

  def new
    @post = Post.new
    @post = @project.posts.build
    # Uncomment to authorize with Pundit
    # authorize @post
  end

  def edit
  end

  def create
    @post = @project.posts.build(post_params)
    # Uncomment to authorize with Pundit
    # authorize @post
    respond_to do |format|
      if @post.save
        format.html { redirect_to [@post.project, @post], notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update_attributes(post_params)
        format.html { redirect_to [@post.project, @post], notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to project_posts_url(@project), status: :see_other, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_post
    @post = Post.find(params[:id])
    # Uncomment to authorize with Pundit
    # authorize @post
  rescue ActiveRecord::RecordNotFound
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:parent_id, :user_id, :title, :flag, :message, :project_id)
    # Uncomment to use Pundit permitted attributes
    # params.require(:post).permit(policy(@post).permitted_attributes)
  end
end
