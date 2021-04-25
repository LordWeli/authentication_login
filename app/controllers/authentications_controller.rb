class AuthenticationsController < ApplicationController
  def auth?
    @user = User.find_by(username: params[:username])

    return false if @user.blank?

    return BCrypt::Password.new(@user.password) == params[:password] ? true : false
  end

  def logged?
    return Login.find_by(user_id: @user_id).nil? ? true : false
  end
end
