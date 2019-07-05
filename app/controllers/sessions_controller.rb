# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :loginRequired, raise: false, only: %i[new create]

  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to newsfeeds_path
    else
      flash[:'alert-danger'] = 'Email / Mật khẩu không đúng'
      redirect_to root_url
    end
  end

  def destroy
    log_out
    flash[:success] = 'Bạn đã đăng xuất'
    redirect_to root_url
  end
end
