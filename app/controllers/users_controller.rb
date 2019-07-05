# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update new index about create]
  skip_before_action :verify_authenticity_token

  skip_before_action :loginRequired

  def index
    # page = params[:page] ? params[:page] : 1;

    @users = User.all
    respond_to do |format|
      # format.html { render :index }
      format.json { render json: @users }
    end
  end

  def show
    user = User.where(sex: params[:sex])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @users }
    end
    @users = User.all

    @friendships = current_user.friends

    # render json: @user
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end
  def about
    @user = User.find(params[:id])
  end

  def create
    @user = User.new user_params
    respond_to do |format|
      if @user.save
        UserMailer.account_activation(@user).deliver_now
        format.html { redirect_to root_url }
        format.json {}
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }

      end
    end
  end

  def update
    if current_user.id === @user.id
      if @user.update_attributes user_params
        flash[:notice] = 'Cập nhật thông tin cá nhân thành công'
        redirect_to user_path
      else
        flash[:alert] = 'Cập nhật thông tin cá nhân thất bại'
        redirect_to edit_user_path
        end
    else
      flash[:alert] = 'Bạn không có quyền chỉnh sửa thông tin này'
      redirect_to edit_user_path(current_user)
    end
  end

#chuc nang ket ban
  def timeline
    @user = User.find(params[:id])
    @post = Post.new
    @image = @post.images.build
    @users = User.all
    @friend = User.all
  end

  def my_friends
    @friendships = current_user.friends
    @users = User.all

  end

  def list_friends
    @friendships = current_user.friends
    @users = User.all
  end

  def search
    @friendships = current_user.friends
    # if params[:search_param].blank?
    #   flash.now[:danger] = "ban chua nhap thong tin"
    # else
    @users = User.where("email LIKE ?","%"+ params[:q]+"%")
    # @users = User.where("first_name LIKE ?","%"+ params[:q]+"%")

  end


    # if params[:search_param].blank?
    #   flash.now[:danger] = "ban chua nhap thong tin"
    # else
    #   @users = User.search(params[:search_param])
    #   @users = current_user.except_current_user(@users)
    #   flash.now[:danger] = "Khong tim thay " if @users.blank?
    # end
    # render partial: 'friends/result'
  # end
  def add_friend
      @friend = User.find(params[:friend])
      current_user.friendships.build(friend_id: @friend.id)
      if current_user.save
        flash[:notice ] = "Thêm bạn thành công"
      else
        flash[:danger] = "Lỗi"
      end
      redirect_to my_friends_path
    end


  private

  def set_user
    @user = User.find_by id: params[:id]
  end

  def user_params
    params.require(:user).permit :first_name, :last_name, :email, :password, :password_confirmation,
                                 :birth, :sex, :introduction, :role, :city, :country
  end
end
