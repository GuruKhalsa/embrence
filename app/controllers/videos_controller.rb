class VideosController < ApplicationController
	before_filter :signed_in_user

	def new
		@video = current_user.videos.build
	end

	def create
		@hero = Hero.find(params[:video][:hero_id])
		@video = current_user.videos.build(params[:video])
		if @video.save
			flash[:success] = "Video created!"
			redirect_to @hero
		else
			redirect_to root_path
		end
	end

	def destroy
		@video = Video.find(params[:id])
		@video.destroy
	    flash[:success] = "Video deleted."
	    if params.has_key?(:video_hero)
	    	@hero = Hero.find(@video.hero_id)
	    	redirect_to @hero
	    else 
	    	@user = User.find(@video.user_id)
	    	redirect_to @user
	    end
	end

end
