class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    # @tag = Tag.new(tag_params)
    # if @tag.save
    #   redirect_to root_path
    # else
    #   render :new
    # end
  end

  def show
    @tag = Tag.find(params[:id])
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(6)
    @posts_num = Post.includes(:user)

  end

  # def edit
  #   @tag = Tag.find(params[:id])

  # end

  # def update
  # end

  # def delete
  # end

  private
  def tag_params
    params.require(:tag).permit(:text, post_ids: [])
  end
end
