class WxController < ApplicationController

  skip_before_action :verify_authenticity_token

	def index
		return render plain: params[:echostr] if valid?
		render plain: "error"
  end

  def handle
    Rails.logger.info("params: ===>" + params.inspect)
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
