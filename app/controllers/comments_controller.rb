class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /comments
  def index
    @pagy, @comments = pagy(Comment.sort_by_params(params[:sort], sort_direction))
    @comments = @post.comments
    # Uncomment to authorize with Pundit
    # authorize @comments
  end

  def show
  end

  def new
    #@comment = Comment.new
    @comment = @post.comments.build
    # Uncomment to authorize with Pundit
    # authorize @comment
  end

  def edit
  end

  def create
    #@comment = Comment.new(comment_params)
    @comment = @post.comments.build(comment_params)
    # Uncomment to authorize with Pundit
    # authorize @comment
    respond_to do |format|
      if @comment.save
        format.html { redirect_to [@comment.post, @comment], notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update_attributes(comment_params)
        format.html { redirect_to [@comment.post, @comment], notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, status: :see_other, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
    # Uncomment to authorize with Pundit
    # authorize @comment
  rescue ActiveRecord::RecordNotFound
    redirect_to comments_path
  end

  def comment_params
    params.require(:comment).permit(:parent_id, :user_id, :message, :post_id)
    # Uncomment to use Pundit permitted attributes
    # params.require(:comment).permit(policy(@comment).permitted_attributes)
  end
end
