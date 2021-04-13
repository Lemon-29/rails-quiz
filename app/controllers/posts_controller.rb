class PostsController < ApplicationController
  before_action :set_post, only: [:edit,:destroy,:update,:show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "Tweeted！"
    else
      render 'new'#after compiled, the view is called out to new.html.erb and changed
    end
  end

  def show

  end

  def confirm
    @post = Post.new(post_params)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "Modified posts"
    else
      render 'edit'
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "Delited tweet"
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end

# 'content' => :content

# { content: 'ff' }[:content]


# params => { content: 'ff' }


# params => { post: { content: 'ff' }  }