class WxController < ApplicationController

	def index
		return render plain: params[:echostr] if valid?
		render plain: "error"
	end

	private

	def valid?
		return false if params.blank?

		signature = params[:signature]
    timestamp = params[:timestamp]
    nonce = params[:nonce]
    token = 'iholen'
    list = [token, timestamp, nonce]

		Digest::SHA1.hexdigest(list.sort.join) == signature
	end

end
