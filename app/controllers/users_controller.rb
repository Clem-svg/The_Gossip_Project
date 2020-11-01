class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(post_params)
    @user.city = City.all.sample

    if @user.save
      flash[:notice] = "Welcome #{@user.first_name}, your account has been created!"
      log_in(@user)
      redirect_to root_path
    else
      render '/users/new'
    end
  end 

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.permit(:first_name, :last_name, :description, :email, :age, :city_id, :password)
  end
end
