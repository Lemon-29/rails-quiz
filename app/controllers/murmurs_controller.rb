class MurmursController < ApplicationController
  before_action :set_murmur, only: [:edit,:destroy,:update,:show]

  def index
    @murmur = Murmur.all
  end

  def new
    @murmur = Murmur.new
  end

  def create
    @murmur = Murmur.new(maurmur_params)
    if @murmur.save
      redirect_to murmur_path, notice: "Murmured！"
    else
      render 'new'
    end
  end

  def show

  end

  def confirm
    @murmur = Murmur.new(murmur_params)
  end

  def edit
    @murmur = Murmur.find(params[:id])
  end

  def update
    if @murmur.update(murmur_params)
      redirect_to tubuyakis_path, notice: "Modified murmur"
    else
      render 'edit'
    end
  end


  def destroy
    @tubuyaki = Murmur.find(params[:id])
    @tubuyaki.destroy
    redirect_to murmur_path, notice: "Delited murmur"
  end

  private

  def murmur_params
    params.require(:tubuyaki).permit(:content)
  end

  def set_murmur
    @murmur = Murmur.find(params[:id])
  end

end
