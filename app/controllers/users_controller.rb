class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| "#{user.name} #{user.password}" }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      name: name,
      email: email,
      password: password,
    )
    response_text = "Hey your new account is created with userrname #{name}"
    render plain: response_text
  end

  def login
    email = params[:email]
    password = params[:password]
    render plain: User.auth?(email, password) ? true : false
  end
end
