class PostsController < ApplicationController
	#before_filter :signed_in_user

	def create
		if signed_in?
			@post = current_user.posts.build(params[:post])
		else
			@post = Post.new(params[:post])
		end
		@hero = Hero.find(params[:post][:hero_id])

		if @post.save
    		flash[:success] = "Message created!"
			redirect_to @hero
		else
			redirect_to @hero
		end
	end

	def destroy
		if params[:destroy_page] == "hero"
			@hero = Hero.find(params[:msg_hero])
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

end
