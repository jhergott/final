class ProsController < ApplicationController

  before_action :find, :only => [:show, :edit, :update, :destroy]
  before_action :require_user, :only => [:new, :create, :edit, :update, :destroy]

  def require_user
    if session[:user_id].blank?
      redirect_to root_url, notice: "You need to login to do that."
    end
  end

  def find
    @pro = Pro.find_by(id: params["id"])
  end

  def index
    if params["keyword"].present?
      @pros = Pro.where("name LIKE ?", "%#{params[:keyword]}%")
    else
      @pros = Pro.all
    end

    @pros = @pros.limit(100)
  end

  def show
    @pro = Pro.find(params[:id])

    if @pro.driver_id
      @driver = Driver.find(@pro.driver_id)
    end
    if @pro.iron_id
      @iron = Iron.find(@pro.iron_id)
    end
    if @pro.ball_id
      @ball = Ball.find(@pro.ball_id)
    end
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