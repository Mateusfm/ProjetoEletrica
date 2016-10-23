class UsersController < ApplicationController
  before_action :require_no_authentication, only: [:new, :create]
  before_action :can_change, only: [:edit, :update, :destroy]
  before_action :require_authentication, only: [:index]

  def index
    authorize User
    @users = User.all
  end

  def show
 	@user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
	Signup.confirm_email(@user).deliver

        format.html { redirect_to @user, notice: 'Cadastro criado com sucesso' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
 

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    def set_user
      @user = User.find(params[:id])
    end


    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def can_change
       unless user_signed_in? && current_user == user
         redirect_to user_path(params[:id])
       end
    end

   
    def user
      @user ||= User.find(params[:id])
    end
end

















