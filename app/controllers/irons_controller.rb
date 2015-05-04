class IronsController < ApplicationController

  def index
    @irons = Iron.all
  end

  def show
    @iron = Iron.find(params[:id])
  end

  def new
  end

  def create
    Iron.create brand: params[:brand],
                name: params[:name],
                price: (params[:price].to_f * 100).to_i,
                iron_url: params[:url],
                category: params[:category]

    redirect_to irons_path
  end

  def edit
    @iron = Iron.find(params[:id])
  end

  def update
    @iron = Iron.find(params[:id])
    @iron.update  brand: params[:brand],
                  name: params[:name],
                  price: (params[:price].to_f * 100).to_i,
                  iron_url: params[:url],
                  category: params[:category]

    redirect_to iron_path
  end

  def destroy
    Iron.delete(params[:id])
    redirect_to irons_path
  end

end
