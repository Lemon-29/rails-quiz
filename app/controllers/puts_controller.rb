class MurmursController < ApplicationController
  before_action :set_murmur, only: [:edit,:destroy,:update,:show]

  def index
    @puts = Puts.all
  end

  def new
    @puts = Puts.new
  end

  def create
    @puts = Puts.new(maurmur_params)
    if @puts.save
      redirect_to murmur_path, notice: "Tweeted！"
    else
      # render 'new'　after compiled, the view is called out to new.html.erb and changed
    end
  end

  def show

  end

  def confirm
    @puts = Puts.new(murmur_params)
  end

  def edit
    @putsr = Puts.find(params[:id])
  end

  def update
    if @puts.update(murmur_params)
      redirect_to tubuyakis_path, notice: "Modified puts"
    else
      render 'edit'
    end
  end


  def destroy
    @puts = Puts.find(params[:id])
    @puts.destroy
    redirect_to murmur_path, notice: "Delited tweet"
  end

  private

  def puts_params
    params.require(:puts).permit(:content)
  end

  def set_puts
    @puts = Puts.find(params[:id])
  end

end
