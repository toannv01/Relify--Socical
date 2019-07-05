class PasswordResetsController < ApplicationController
  before_action :set_user, only: %i[show edit update new index about create]

  skip_before_action :loginRequired


  def new
  end

  def create
    user =User.find_by_email(params[:email])
    user.send_password_resets if user
    redirect_to root_url, :notice => "Mật khẩu mới đã được gửi vào email, vui lòng kiểm tra email để xác nhận !"

  end

  def show
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 1.minutes.ago
    # if @user.password_reset_sent_at < 1.hours.ago
    # seconds
      redirect_to new_password_reset_path, :alert =>"Thời gian hết hạn"
    elsif @user.update_attributes user_params
      redirect_to root_url, :notice => "Mật khẩu đã được cập nhật !"
    else
      render :show
    end
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
