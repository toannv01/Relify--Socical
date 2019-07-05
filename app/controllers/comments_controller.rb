class CommentsController < ApplicationController
  before_action :set_comment,only: [:edit, :update, :show, :destory]
  skip_before_action :verify_authenticity_token

  def index
    commentable_id = params[:commentable_id]
    commentable_type = params[:commentable_type]
    comments = Comment.where(commentable_id: commentable_id, commentable_type: commentable_type)
       .paginate(:page => params[:page], :per_page => 2)
       .order('created_at desc')
    newcomment = []
    comments.each do |comment1|
      newcomment << {
        id: comment1.id,
        name: comment1.user.first_name,
        user_id: comment1.user_id,
        commentable_type: comment1.commentable_type,
        commentable_id: comment1.commentable_id,
        content: comment1.content
      }
    end
    render json: newcomment
  end
  
  def show
  end
 
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new comment_params
    @post=Post.all.order('created_at desc')
    if @comment.save
      render json: {
        name: current_user,
        comment: @comment,
        post: @post
      },status: :created, location: @comment
      flash[:success] = "Object successfully created"
      
    else
      flash[:error] = "Something went wrong"
    end
  end
  
  def update
    @comment = Comment.find(params[:id])
    @post=Post.all.order('created_at desc')
      if @comment.update_attributes comment_params
        flash[:success] = "Object was successfully updated"
        render json: {
        name: current_user,
        comment: @comment,
        post: @post
        },status: :created, location: @comment
      else
        flash[:error] = "Something went wrong"
      end
  end
  
  def destroy
    # @comment = Comment.find(params[:id])
    @comment = current_user.comments.find_by id: params[:id]
    if @comment
      @comment.destroy
      flash[:success] = 'Object was successfully deleted.'
      # redirect_back fallback_location: newsfeeds_path
      render json: {text: "success"}
    else
      flash[:error] = 'Something went wrong'
      render json: {text: "false"}
    end
  end
    
  private

    def set_comment
      # @comment =Comment.find_by id: params[:id]
      @comment = current_user.comments.find_by id: params[:user_id]
    end
   
    def comment_params
      params[:comment][:user_id] = current_user.id
      # params[:comment][:user_id] = current_user.id
      params.require(:comment).permit :user_id, :commentable_id, :commentable_type, :content
    end
end
