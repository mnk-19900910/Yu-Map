class TagsController < ApplicationController
  def new
    @tags = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  private
  def tag_params
    params.require(:tag).permit(:text, post_ids: [])
  end
end
