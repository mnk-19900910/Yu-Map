class TestsessionsController < ApplicationController
  def create
    user=User.find_by(email:"test@test")
    session[:user_id] = user.id
    redirect_to user
  end
end