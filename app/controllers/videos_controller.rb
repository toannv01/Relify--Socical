class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /videos
  # GET /videos.json
  def index
    @post = current_user.posts.all
    video = Video.all.where(videos: { user_id: current_user.id })
    @post_videos = video.joins("INNER JOIN posts ON videos.post_id = posts.id")
    render json: {post: @post, video: @post_videos}
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    id_post = @video.post_id
    @post_video = Post.find(id_post)
    render json: {post: @post_video, video: @video,  user: current_user}
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)
      if @video.save
        render json: @video, status: :created
      else
        render json: @video.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    # video_params = {
    #   user_id: current_user.id,
    #   post_id: 1,
    #   video: params[:video]
    # }
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
      def set_video
        @video = Video.find(params[:id])
      end
      # Never trust parameters from the scary internet, only allow the white list through.
      def video_params
          video_Params = {
             user_id: current_user.id,
             post_id: nil,
             video: params[:video]
           }
      end
end
