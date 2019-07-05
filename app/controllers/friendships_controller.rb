class FriendshipsController < ApplicationController



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
  def destroy
    @friendship = current_user.friendships.where(friend_id: params[:id]).first
    @friendship.destroy
    flash[:notice] = "Hủy kết bạn thành công"
    redirect_to my_friends_path
  end

end
