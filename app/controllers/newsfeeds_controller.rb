# frozen_string_literal: true

class NewsfeedsController < ApplicationController
  def index
    @post = Post.new
    @image = @post.images.build
    @users = User.all
    @friend = User.all
    @friendships = current_user.friends

  end

  def list_image
    @users = User.all

    @image = Image.new
  end
  def list_video
    @users = User.all
    @video = Video.new
  end
end
