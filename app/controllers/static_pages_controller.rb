class StaticPagesController < ApplicationController
	def blog
		redirect_to "http://gensirois.wix.com/pinup-go"
	end
end