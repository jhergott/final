class BallsController < ApplicationController

  def index
    @balls = Ball.all
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
