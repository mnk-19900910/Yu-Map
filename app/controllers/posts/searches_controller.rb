class Posts::SearchesController < ApplicationController
  def index
    @posts = Post.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end
end
