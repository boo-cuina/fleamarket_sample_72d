class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
    User.create(user_params)
  end
  
  private
    def user_params
      params.requie(:user).permit(:nick_name, :mail, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day, :postcode, :prefecture, :city, :block, :building)
    end

end
