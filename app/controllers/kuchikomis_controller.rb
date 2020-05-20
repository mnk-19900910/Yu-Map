class KuchikomisController < ApplicationController
  def create
    @kuchikomi = Kuchikomi.create(kuchikomi_params)
    respond_to do |format|
      format.html { redirect_to "/posts/#{@kuchikomi.post.id}"  }
      format.json
    end
  end

  private
  def kuchikomi_params
    params.require(:kuchikomi).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
