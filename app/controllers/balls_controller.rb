class BallsController < ApplicationController

  before_action :find, :only => [:show, :edit, :update, :destroy]
  before_action :require_user, :only => [:new, :create, :edit, :update, :destroy]

  def require_user
    if session[:user_id].blank?
      redirect_to root_url, notice: "You need to login to do that."
    end
  end

  def find
    @ball = Ball.find_by(id: params["id"])
  end

  def index
    if params["keyword"].present?
      @balls = Ball.where("name LIKE ?", "%#{params[:keyword]}%")
    else
      @balls = Ball.all
    end

    @balls = @balls.limit(100)
  end

  def show
    @ball = Ball.find(params[:id])
  end

  def new
  end

  def create
    Ball.create brand: params[:brand],
                name: params[:name],
                price: (params[:price].to_f * 100).to_i,
                ball_url: params[:url],
                compression: params[:compression]

    redirect_to balls_path
  end

  def edit
    @ball = Ball.find(params[:id])
  end

  def update
    @ball = Ball.find(params[:id])
    @ball.update  brand: params[:brand],
                  name: params[:name],
                  price: (params[:price].to_f * 100).to_i,
                  ball_url: params[:url],
                  compression: params[:compression]

    redirect_to ball_path
  end

  def destroy
    Ball.delete(params[:id])
    redirect_to balls_path
  end

end
