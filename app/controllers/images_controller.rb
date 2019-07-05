# frozen_string_literal: true

class ImagesController < ApplicationController

  before_action :set_image, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token


  # GET /images
  # GET /images.json
  def index
    @post = current_user.posts.all
    image = Image.all.where(images: { user_id: current_user.id })
    @post_images = image.joins("INNER JOIN posts ON images.image_able_id = posts.id AND images.image_able_type = 'Post'")
    render json: {post: @post, image: @post_images}
  end


  # GET /images/1
  # GET /images/1.json
  def show
    # @post = Post.all
    id_post = @image.image_able_id
    @post_image = Post.find(id_post)
    render json: {post: @post_image, image: @image, user: current_user}
    # if(@image.image_able_id = @post.id){
    #   @post_image = Post.find_by id: params[:image_able_id]
    #   render json: image: @image, post: @post_image}
    # end
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit; end

  # POST /images
  # POST /images.json
  def create
    imageParams = {
        user_id: current_user.id,
        image_able_id: nil,
        image_able_type: nil,
        image: params[:image]
      }
    @image = Image.new(imageParams)
    if @image.save
      render json: @image, status: :created, location: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # def image_params

    # end
    # Never trust parameters from the scary internet, only allow the white list through.
    # def image_params
    #   # return if params[:images].nil?
    #   # params[:images]["image"].each do |a|
    #   #   @image = @image.images.create! image: a, image_able_id: current_user[:id], image_able_type: "User"
    #   # end
    # end
end
