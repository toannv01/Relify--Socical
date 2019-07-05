class PostsController < ApplicationController
  before_action :set_post, only: %i(show edit update delete)

  def index
    posts = Post.all.order('created_at desc')

    newPost = []

    posts.each do |post|
      comments = Comment.findByTypeAndId('Post', post.id)
      newComments =[]
      comments.each do |com|
        newComments << {
         id: com.id,
         user_id: com.user_id,
         usercomment: com.user.first_name,
         commentable_type: com.commentable_type,
         commentable_id: com.commentable_id,
         content: com.content
        }
      end
      newImages =[]
      images = Image.findByImageAndId('Post',post.id)
       images.each do |ima|
        newImages << {
          id: ima.id,
          image_able_id: ima.image_able_id,
          image_able_type: ima.image_able_type,
          image: ima.image
        }
       end

      newVideo =[]
      videos = Video.findByVideoAndId(post.id)
      videos.each do |vid|
        newVideo << {
          id: vid.id,
          video: vid.video
        }
      end

      newPost << {
        id: post.id,
        user_id: post.user_id,
        context: post.context,
        like_count: post.like_count,
        comments: newComments,
        comments_count: post.comments_count,
        block: post.block,
        username: post.user.first_name,
        created_at: post.created_at,
        updated_at: post.updated_at,
        images: newImages,
        video: newVideo
      }
    end

    #Ex:- :limit => 40
     render json: newPost

    # render json: posts
    # @image = @posts.eager_load.(:images)
    #  render json: {
    #   post: @posts,
    #   image: @image
  # }
  end

  def destroy
    @post = current_user.posts.find_by id: params[:id]
    if @post
      @post.destroy
      flash[:success] = 'Object was successfully deleted.'
      render json: {text: "success"}
    else
      flash[:error] = 'Something went wrong'
      render json: "can not delete "
    end
  end

  def show
    @image = @post.images

    # @commentable = @post
    # @comments = @commentable.comments
    # @comment = Comment.new
    render json: {post: @post, image: @image}
  end

  def new
    @post = current_user.posts.build
    @image = @post.images.build
  end

  def edit
  end

  def create
    post_Params = {
      context: params[:context]
    }
    @post = current_user.posts.build(post_Params)

    if @post.save
      uploadedVideo = params[:uploadedVideo]
      Video.where(id: uploadedVideo).update(post_id: @post.id)
      uploadedImages = params[:uploadedImages]
      Image.where(id: uploadedImages).update(image_able_id: @post.id, image_able_type: 'Post')

      render json: {
        user: current_user,
        post: @post,
        image: @post.images,
        video: @post.videos
      }, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
      if @post.update(post_params)
        render :show, status: :ok, location: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
  end



  # def destroy
  #   @post.destroy
  #   render json: @post
  # end

  private
    def set_post
      @post = current_user.posts.find_by id: params[:user_id]

      # @post = Post.find(params[:id])
      # @post = Post.find params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def post_params
    #   params.require(:post).permit(:context, images_attributes:
    #     [:id, :image])
    # end

    # def save_post_image
    #   return if params[:images].nil?
    #   params[:images]["image"].each do |a|
    #     @image = @post.images.create! image: a
    #   end
    # end
end
