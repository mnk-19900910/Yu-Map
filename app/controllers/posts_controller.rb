class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show ,:search]

  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(6)
    @posts_num = Post.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def edit
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
  end

  def show
    @kuchikomi = Kuchikomi.new
    @kuchikomis = @post.kuchikomis.includes(:user)
    @tag = Tag.new
    @tags = @post.tags.includes(:user)
  end
  
  def search
    @posts = Post.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def post_params
    params.require(:post).permit(:name, :location, :image).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
