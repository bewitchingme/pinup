module VenuesHelper

	def url(a)
		/(https?:\/\/)?\w*\.\w+(\.\w+)*(\/\w+)*(\.\w*)?/.match( a ).to_s
	end

end
