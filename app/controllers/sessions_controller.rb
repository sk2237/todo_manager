class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      render plain: "correct"
    else
      render plain: "Incorrect"
    end
  end
end
