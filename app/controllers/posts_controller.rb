class PostsController < ApplicationController
	#before_filter :signed_in_user
	before_filter :setup_negative_captcha, :only => [:create]

	def create
		if signed_in?
			@post = current_user.posts.build(@captcha.values)
		else
			@post = Post.new(@captcha.values)
		end
		@hero = Ember.find(@captcha.values[:ember_id])

		if @captcha.valid? && @post.save
    	flash[:success] = "Message created!"
			redirect_to @hero
		else
			flash[:notice] = @captcha.error if @captcha.error
			redirect_to @hero
		end
	end

	def destroy
		if params[:destroy_page] == "hero"
			@hero = Ember.find(params[:msg_hero])
			Post.find(params[:id]).destroy
		    flash[:success] = "Post deleted."
		    redirect_to @hero
		else
			@user = User.find(params[:msg_user])
			Post.find(params[:id]).destroy
		    flash[:success] = "Message deleted."
		    redirect_to @user

		end
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
