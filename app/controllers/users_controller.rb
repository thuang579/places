class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update_attributes(user_params)
			render 'show'
		else
			flash[:notice] = @user.errors.full_messages.to_sentence

			render :edit
		end
	end

	def create
		@user = User.new(user_params)

		if @user.save
			render 'show'
		else
			flash[:notice] = @user.errors.full_messages.to_sentence
			render 'new'
		end

	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to '/'
		
	end

	private

	def user_params
		params.require(:user).permit(:name, :email)
	end

end
