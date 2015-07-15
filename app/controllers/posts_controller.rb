class PostsController < ApplicationController
	before_filter :authorize, :except => [:index, :show]
	before_action :authenticate_user!, except: [:index, :show]


	def index
		@post = Post.all.order('created_at DESC')
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(params[:post].permit(:date, :stime, :etime))
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to root_path
	end

	private

	def post_params
		params.require(:post).permit(:date, :stime, :etime)
	end

end
