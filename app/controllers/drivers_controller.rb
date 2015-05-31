class DriversController < ApplicationController

  before_action :find, :only => [:show, :edit, :update, :destroy]
  before_action :require_user, :only => [:new, :create, :edit, :update, :destroy]

  def require_user
    if session[:user_id].blank?
      redirect_to root_url, notice: "You need to login to do that."
    end
  end

  def find
    @driver = Driver.find_by(id: params["id"])
  end

  def index
    if params["keyword"].present?
      @drivers = Driver.where("name LIKE ?", "%#{params[:keyword]}%")
    else
      @drivers = Driver.all
    end

    @drivers = @drivers.limit(100)
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def new
  end

  def create
    Driver.create brand: params[:brand],
                  name: params[:name],
                  price: (params[:price].to_f * 100).to_i,
                  driver_url: params[:url],
                  launch: params[:launch],
                  spin: params[:spin]

    redirect_to drivers_path
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])
    @driver.update brand: params[:brand],
                   name: params[:name],
                   price: (params[:price].to_f * 100).to_i,
                   driver_url: params[:url],
                   launch: params[:launch],
                   spin: params[:spin]

    redirect_to driver_path
  end

  def destroy
    Driver.delete(params[:id])
    redirect_to drivers_path
  end

end