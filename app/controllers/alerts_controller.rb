class AlertsController < ApplicationController


	def new
		@alert = Alert.new
	end

	def index
		@alerts = Alert.all
	end

	def show
		@alert = Alert.find(params[:id])
	end

	def edit
		@alert = Alert.find(params[:id])
	end

	def update
		@alert = Alert.find(params[:id])

		if @alert.update_attributes(alert_params)
			render 'show'
		else
			flash[:notice] = @alert.errors.full_messages.to_sentence

			render :edit
		end
	end

	def create
		@alert = Alert.new(alert_params)

		if @alert.save
			render 'show'
		else
			flash[:notice] = @alert.errors.full_messages.to_sentence
			render 'new'
		end

	end

	def destroy
		@alert = Alert.find(params[:id])
		@alert.destroy
		redirect_to '/'
		
	end

	private

	def alert_params
		params.require(:alert).permit(:name)
	end
end
