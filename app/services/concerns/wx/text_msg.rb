module Wx::TextMsg
  extend ActiveSupport::Concern

  # <xml>
  #   <ToUserName><![CDATA[toUser]]></ToUserName>
  #   <FromUserName><![CDATA[fromUser]]></FromUserName>
  #   <CreateTime>12345678</CreateTime>
  #   <MsgType><![CDATA[text]]></MsgType>
  #   <Content><![CDATA[你好]]></Content>
  # </xml>
  def text_msg(to_user, from_user, create_time, text)
    """
    <xml>
      <ToUserName><![CDATA[#{from_user}]]></ToUserName>
      <FromUserName><![CDATA[#{to_user}]]></FromUserName>
      <CreateTime>#{create_time}</CreateTime>
      <MsgType><![CDATA[text]]></MsgType>
      <Content><![CDATA[#{text}]]></Content>
    </xml>
    """
  end

end