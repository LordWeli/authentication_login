class AuthenticationsController < ApplicationController
  def auth?
    @user = User.all.select do |user|
      user.username == params[:username]
    end

    return false if @user.blank?

    if BCrypt::Password.new(@user.first.password) == params[:password]
      return true
    else
      return false
    end
  end
end
