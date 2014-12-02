class PlacesController < ApplicationController

	def new
		@place = Place.new
	end

	def index
		@places = Place.all
	end

	def show
		@place = Place.find(params[:id])
	end

	def edit
		@place = Place.find(params[:id])
	end

	def update
		@place = Place.find(params[:id])

		if @place.update_attributes(place_params)
			render 'show'
		else
			flash[:notice] = @place.errors.full_messages.to_sentence

			render :edit
		end
	end

	def create
		@place = Place.new(place_params)

		if @place.save
			redirect_to '/'
		else
			flash[:notice] = @placeerrors.full_messages.to_sentence
			render 'new'
		end

	end

	def destroy
		@place = Place.find(params[:id])
		@place.destroy
		redirect_to '/'
		
	end

	private

	def place_params
		params.require(:place).permit(:name, :location, :place_type)
	end

end