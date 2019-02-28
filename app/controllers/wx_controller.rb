class WxController < ApplicationController

  skip_before_action :verify_authenticity_token

	def index
		return render plain: params[:echostr] if valid?
		render plain: "error"
  end

  # xml_data example
  # {
  #   "ToUserName"=>"gh_532c79846a36",
  #   "FromUserName"=>"ol3bp1faQ4wZraeEuivyNT6Alssw",
  #   "CreateTime"=>"1551354824",
  #   "MsgType"=>"text",
  #   "Content"=>"在",
  #   "MsgId"=>"22210060061293467"
  # }
  def handle
    xml_data = Hash.from_xml(request.body.read).with_indifferent_access[:xml]
    logger.info(xml_data.inspect)

    msg = Wx::MsgService.new(xml_data).get_msg
    logger.info(msg)

    render plain: msg
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
