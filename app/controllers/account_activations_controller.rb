# frozen_string_literal: true

class AccountActivationsController < ApplicationController
  def unVerify
    # if  @user = User.find_by_email(params[:sessions][:user_id])
    UserMailer.account_activation(@user).deliver_now
    #  end
  end

  def verify
    token = params[:token]
    auth_verify = JsonWebToken.decode(token)
    tokenExp = auth_verify.first['exp']
    currentTime = Time.now.to_i
    user_id = auth_verify.first['user_id']
    user = User.find_by(id: user_id)

    if !user.activated? && tokenExp >= currentTime
      user.update_attribute(:activated, true)
      respond_to do |format|
        format.html { redirect_to sucessVerify_path }
        format.json { render :sucessVerify, status: :ok }
      end
    end
  rescue JWT::ExpiredSignature
    respond_to do |format|
      format.html { redirect_to unVerify_path }
      format.json { render :token, status: :n_ok }
    end
  end
end
