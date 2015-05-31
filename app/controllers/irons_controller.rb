class IronsController < ApplicationController

  before_action :find, :only => [:show, :edit, :update, :destroy]
  before_action :require_user, :only => [:new, :create, :edit, :update, :destroy]

  def require_user
    if session[:user_id].blank?
      redirect_to root_url, notice: "You need to login to do that."
    end
  end

  def find
    @iron = Iron.find_by(id: params["id"])
  end

  def index
    if params["keyword"].present?
      @irons = Iron.where("name LIKE ?", "%#{params[:keyword]}%")
    else
      @irons = Iron.all
    end

    @irons = @irons.limit(100)
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
