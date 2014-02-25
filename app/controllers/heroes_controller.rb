class HeroesController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create, :edit, :update, :delete]

	def show
		@hero = Hero.find(params[:id])
		#@user = User.find(params[:hero][:user_id])
		if signed_in?
			@post = current_user.posts.build
		else
			@post = Post.new
		end
		@posts = @hero.posts.paginate(page: params[:page], :per_page => 15)
		@postings = @hero.posts.all(:order => 'RAND()', :limit => 20)
		@images = @hero.hero_images.all(:order => 'RAND()', :limit => 20)
		@videos = @hero.videos.all(:order => 'RAND()', :limit => 20)
		@all_images = @hero.hero_images.paginate(page: params[:image_page], :per_page => 16)
		@all_videos = @hero.videos#.paginate(page: params[:video_page], :per_page => 6)
	end

	def index
		@heroes = Hero.paginate(page: params[:page]).search(params[:search])		
	end

	def new
		@hero = Hero.new
	end

	def create
		@hero = current_user.heroes.build(params[:hero])
		@hero.name = "#{@hero.first_name} #{@hero.last_name}"
		if @hero.save
	  		flash[:success] = "Thank you for sharing their story!  Add images, videos, and messages below."
	  		redirect_to @hero
	  	else
	  		render 'new'
	  	end
	end

	def edit
		@hero = Hero.find(params[:id])
	end

	def update
		@hero = Hero.find(params[:id])
		@hero.name = "#{@hero.first_name} #{@hero.last_name}"
		if @hero.update_attributes(params[:hero])
	        flash[:success] = "Hero updated"
	        redirect_to @hero
	    else
	      render 'edit'
	    end
	end

	def destroy
		Hero.find(params[:id]).destroy
	    flash[:success] = "Hero destroyed."
	    redirect_to heroes_path
	end

end
