require 'line/bot'

class LineClient
  #環境変数の設定
  CHANNEL_SECRET = ENV['LINE_CHANNEL_SECRET']
  CHANNEL_ACCESS_TOKEN = ENV['LINE_CHANNEL_ACCESS_TOKEN']
  PUSH_TO_ID = ENV['PUSH_TO_ID']

  #clientの読み込み
  attr_reader :client

  def initialize
    #@clientがfalseか未定義なら代入
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = CHANNEL_SECRET
      config.channel_token = CHANNEL_ACCESS_TOKEN
    }
  end

  def reply(reply_token, message)
    client.reply_message(reply_token, text_message(message))
  end

  def push(message)
    client.push_message(PUSH_TO_ID, text_message(message))
  end

  private

  def text_message(text)
    {
        "type" => "text",
        "text" => text
    }
  end
end
