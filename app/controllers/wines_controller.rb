class WinesController < ApplicationController
	def index
		@available_at = Time.now
		@wines = Wine.all
	end

	def show
		@wine = Wine.find(params[:id])
		@count = Wine.count
	end
end