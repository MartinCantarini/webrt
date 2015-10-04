class CrimesController < ApplicationController
  before_action :authenticate_admin!
  def index
    if params[:search]
      @crimes = Crime.search(params[:search]).order("created_at DESC")
    else
      @crimes = Crime.all.order('created_at DESC')
    end
  end

  def show
    @crime=Crime.find(params[:id])
  end

  def new
    @crime=Crime.new
  end

  def update
    @crime=Crime.find(params[:id])
    @crime.update(crime_param)
    redirect_to crime_path
  end

  def destroy
    @crime=Crime.find(params[:id])
    @crime.destroy
    if(@crime.save)
      redirect_to users_path
    else
      flash.now[:error] = "No se pudo eliminar el usuario, intente nuevamente en unos segundos"
      redirect_to users_path
    end  
  end

  def create
    @crime=Crime.create(params.require(:crime).permit([:user_id,:ippcausanro,:delito,:fecha,:interviene,:detalles]))
    redirect_to crimes_path
  end

  def edit
    @crime=Crime.find(params[:id])
  end
end
