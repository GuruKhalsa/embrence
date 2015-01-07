class EmbersController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create, :edit, :update, :delete]
	before_filter :setup_negative_captcha, :only => [:show]

	def show
		@hero = Ember.friendly.find(params[:id])
		#@user = User.find(params[:hero][:user_id])
		if signed_in?
			@post = current_user.posts.build
		else
			@post = Post.new
		end
		@posts = @hero.posts.order(created_at: :desc).paginate(page: params[:page], :per_page => 15)
		@postings = @hero.posts.all(:order => 'RAND()', :limit => 20)
		@images = @hero.hero_images.all(:order => 'RAND()', :limit => 20)
		@videos = @hero.videos.all(:order => 'RAND()', :limit => 20)
		@all_images = @hero.hero_images.paginate(page: params[:image_page], :per_page => 16)
		@all_videos = @hero.videos#.paginate(page: params[:video_page], :per_page => 6)
	end

	def index
		@heroes = Ember.paginate(page: params[:page]).search(params[:search])		
	end

	def new
		@hero = Ember.new
	end

	def create
		@hero = current_user.embers.build(params[:ember])
		@hero.name = "#{@hero.first_name} #{@hero.last_name}"
		if @hero.save
	  		flash[:success] = "Thank you for sharing their story!  Add images, videos, and messages below."
	  		redirect_to @hero
	  	else
	  		render 'new'
	  	end
	end

	def edit
		@hero = Ember.friendly.find(params[:id])
	end

	def update
		@hero = Ember.friendly.find(params[:id])
		@hero.name = "#{@hero.first_name} #{@hero.last_name}"
		if @hero.update_attributes(params[:ember])
        flash[:success] = "Ember updated"
        redirect_to @hero
    else
      render 'edit'
    end
	end

	def destroy
		Ember.friendly.find(params[:id]).destroy
	    flash[:success] = "Ember destroyed."
	    redirect_to embers_path
	end

	private
	  def setup_negative_captcha
	    @captcha = NegativeCaptcha.new(
	      # A secret key entered in environment.rb. 'rake secret' will give you a good one.
	      secret: ENV['NEGATIVE_CAPTCHA_SECRET'],
	      spinner: request.remote_ip,
	      # Whatever fields are in your form
	      fields: [:name, :post, :ember_id],
	      # If you wish to override the default CSS styles (position: absolute; left: -2000px;) used to position the fields off-screen
	      css: "display: none",
	      params: params
	    )
	  end

end
