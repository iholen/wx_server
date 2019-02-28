class Wx::MsgService

  include Wx::TextMsg

  attr_accessor :xml_data

  def initialize(xml_data)
    self.xml_data = xml_data
  end

  def send
    text_msg(xml_data[:FromUserName], xml_data[:ToUserName], xml_data[:CreateTime], xml_data[:Content])
  end

end