class UsersController < ApplicationController

  before_action :authorize, only: [:show]

  def new
    @user = User.new
  end

  def authorize
    @user = User.find_by(id: params[:id])
    if @user.blank? || session[:user_id] != @user.id
      redirect_to root_url, notice: "Nice try!"
    end
  end

  def create
    p = params.permit(:email, :password)
    @user = User.new(p)
    if @user.save
      redirect_to root_url, notice: "Thanks for signing up, #{params[:email]}!"
    else
      render "new"
    end
  end
end
