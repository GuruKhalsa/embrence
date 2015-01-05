class HeroImagesController < ApplicationController
	before_filter :signed_in_user

	def new
		@image = current_user.hero_images.build
		@hero = Ember.find(params[:image_hero])
	end

	def create
		@hero = Ember.find(params[:hero_image][:ember_id])
		@image = current_user.hero_images.build(params[:hero_image])
		if @image.save
    		flash[:success] = "Image created!"
			redirect_to @hero
		else
			redirect_to @hero
		end
	end

	def edit
	end

	def update
	end

	def destroy
		@image = HeroImage.find(params[:id])
		@image.destroy
		flash[:success] = "Image deleted."
		if params.has_key?(:img_hero)
			@hero = Ember.find(@image.ember_id)
			redirect_to @hero
		else 
	    	@user = Ember.find(@image.user_id)
	    	redirect_to @user
	    end
	end

end
