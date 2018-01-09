class UsersController < ApplicationController
  def new
    render :new
  end

  def show
    @user = User.find( params[:id] )
    render :show
  end

  def index

  end

  def create
    user = User.new(user_params)
    if user.save
      login(user)
      redirect_to users_url
    else
      flash[:errors] = user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
