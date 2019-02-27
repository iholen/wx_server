class WelcomeController < ApplicationController

	def index
		render plain: "Capistrano Deploy"
	end

end
