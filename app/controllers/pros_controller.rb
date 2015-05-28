class ProsController < ApplicationController

  def index
    @pros = Pro.all
  end

  def show
    @pro = Pro.find(params[:id])
    @driver = Driver.find(@pro.driver_id)
    @iron = Iron.find(@pro.iron_id)
    @ball = Ball.find(@pro.ball_id)
  end

  def new
    @drivers = Driver.all
    @irons = Iron.all
    @balls = Ball.all
  end

  def create
    Pro.create  name: params[:name],
                driver_id: params[:driver_id],
                iron_id: params[:iron_id],
                ball_id: params[:ball_id]

    redirect_to pros_path
  end

  def edit
    @pro = Pro.find(params[:id])
    @drivers = Driver.all
    @irons = Iron.all
    @balls = Ball.all
  end

  def update
    @pro = Pro.find(params[:id])
    @pro.update  driver_id: params[:driver_id],
                 iron_id: params[:iron_id],
                 ball_id: params[:ball_id]

    redirect_to pro_path
  end

  def destroy
    Pro.delete(params[:id])
    redirect_to pros_path
  end

end