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
		@hero = Hero.find(params[:video_hero])
		Video.find(params[:id]).destroy
	    flash[:success] = "Video deleted."
	    redirect_to @hero
	end

end
