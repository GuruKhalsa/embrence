class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: :destroy


  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
    @user.name = "#{@user.first_name} #{@user.last_name}"
  	if @user.save
      sign_in @user
  		flash[:success] = "Welcome to Emberence"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
  	@user = User.find(params[:id])
    # @hero = Hero.find(params[:id])
    @heroes = @user.heroes.all
    @posts = @user.posts.paginate(page: params[:page])
    @images = @user.hero_images.all
    @videos = @user.videos.all
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.name = "#{@user.first_name} #{@user.last_name}"
    if @user.update_attributes(params[:user])
        flash[:success] = "Profile updated"
        sign_in @user
        redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
