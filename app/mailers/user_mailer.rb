# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'toanguyenviet0795@gmail.com'
  def account_activation(user)
    @user = user
    mail to: user.email, subject: 'Thanh cong'
  end
end
