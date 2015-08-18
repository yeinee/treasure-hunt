class StaticController < ApplicationController
	def index
		@rand_color = ["rgb(250,245,231)", "rgb(243,207,212)",
						"rgb(53,84,106)", "rgb(99,168,199)",
						"rgb(169,208,225)", "rgb(229,228,240)"]
	end
end