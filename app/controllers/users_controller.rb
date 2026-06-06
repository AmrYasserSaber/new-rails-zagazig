class UsersController < ApplicationController
  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    begin
      if @user.save
        redirect_to @user, notice: "User was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotUnique
      @user.errors.add(:email, "has already been taken")
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user = User.find(params[:id])
    begin
      if @user.update(user_params)
        redirect_to @user, notice: "User was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotUnique
      @user.errors.add(:email, "has already been taken")
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, notice: "User was successfully destroyed."
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :address)
  end
end
