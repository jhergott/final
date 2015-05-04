class DriversController < ApplicationController

  def index
    @drivers = Driver.all
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