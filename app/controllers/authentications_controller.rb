class AuthenticationsController < ApplicationController
  # attr_accessor: login
  # def initialize
    # @login = login?
  # end

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

  # def login?
  #   unless session[:user].nil?
  #     return true
  #   else
  #     return false
  #   end
  # end
end
