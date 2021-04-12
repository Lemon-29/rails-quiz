class PostsController < ApplicationController
  before_action :set_posts, only: [:edit,:destroy,:update,:show]

  def index
    @posts = Posts.all
  end

  def new
    @posts = Posts.new
  end

  def create
    @posts = Posts.new(maurmur_params)
    if @posts.save
      redirect_to posts_path, notice: "Tweeted！"
    else
      # render 'new'　after compiled, the view is called out to new.html.erb and changed
    end
  end

  def show

  end

  def confirm
    @posts = Posts.new(murmur_params)
  end

  def edit
    @posts = Posts.find(params[:id])
  end

  def update
    if @posts.update(murmur_params)
      redirect_to tubuyakis_path, notice: "Modified puts"
    else
      render 'edit'
    end
  end


  def destroy
    @posts = Posts.find(params[:id])
    @posts.destroy
    redirect_to murmur_path, notice: "Delited tweet"
  end

  private

  def posts_params
    params.require(:puts).permit(:content)
  end

  def set_posts
    @posts = Posts.find(params[:id])
  end

end
