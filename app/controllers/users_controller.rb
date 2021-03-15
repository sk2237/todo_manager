class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :ensure_user_logged_in

  def new
    render "new"
  end

  def index
    render plain: User.all.map { |user| "#{user.first_name} #{user.last_name} #{user.password_digest}" }.join("\n")
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    if user.save
      session[:current_user_id] = user.id
      redirect_to "/"
    else
      flash[:error] = user.errors.full_messages.join(",")
      redirect_to new_user_path
    end
  end

  def login
    email = params[:email]
    password = params[:password]
    render plain: User.auth?(email, password) ? true : false
  end
end
