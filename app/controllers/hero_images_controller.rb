class HeroImagesController < ApplicationController
	before_filter :signed_in_user, only: [:edit, :update, :destroy]

	def new
		if current_user
			@image = current_user.hero_images.build
		else
			@image = HeroImage.new
		end
		@hero = Ember.find(params[:image_hero])
	end

	def create
		@hero = Ember.find(params[:hero_image][:ember_id])
		if current_user
			@image = current_user.hero_images.build(params[:hero_image])
		else
			@image = HeroImage.new(params[:hero_image])
		end

		if @image.save
    	flash[:success] = "Image created!"
			redirect_to @hero
		else
			flash[:alert] = "Image could not be uploaded"
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
    	@user = User.find(@image.user_id)
    	redirect_to @user
    end
	end

end
