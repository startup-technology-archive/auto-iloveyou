# DB設定ファイルの読み込み
require 'sinatra'
require 'sinatra/activerecord'
require 'twilio-ruby'
require 'dotenv'

Dotenv.load

SID = ENV['SID']
TOKEN = ENV['TOKEN']
HOST = ENV['HOST']

# 一覧表示
get '/' do
  @calls = Call.order(created_at: :desc)
  erb :index
end

# 入力フォーム
get '/new' do
  erb :new
end

# DB登録 & call
post '/create' do
  @call = Call.create!(
    from_name: params['from_name'],
    to_name: params['to_name'],
    tel: params['tel'],
    message: params['message'],
    status: 0
  )
  tel = params['tel']
  tel.gsub!(/^0/, '+81')
  client = Twilio::REST::Client.new SID, TOKEN

  client.calls.create(
    from: '+815031331466',
    to: tel,
    url: "http://#{HOST}/iloveyou/" + @call.id.to_s
  )

  redirect to ('/')

end

# 告白
post '/iloveyou/:id' do
  call = Call.find(params["id"])
  Twilio::TwiML::Response.new do |r|
    r.Say '自動告白サービス。告白の行方です。', :language => 'ja-jp'
    r.Pause length: 1
    r.Say "#{call.to_name}さん。#{call.from_name}さんからメッセージがございます", :language => 'ja-jp'
    r.Pause length: 1
    r.Say call.message, :language => 'ja-jp'
    r.Gather action: "http://#{HOST}/result/#{params["id"]}", numDigits: 1 do |g|
      g.Say "この告白にOKの場合は1を。一旦考える場合は2を。ごめんなさいの場合は3を入力してください。", :language => 'ja-jp'
    end
  end.text
end

# 告白受信
post '/result/:id' do
  if params['Digits'].present?
    Call.find(params["id"]).update!(status: params['Digits'])
  end
  Twilio::TwiML::Response.new do |r|
    r.Say "ご利用ありがとうございました", :language => 'ja-jp'
  end.text
end

class Call < ActiveRecord::Base
  def status_name
    case self.status
    when 1
      "OK"
    when 2
      "もうちょっと考えさせてください"
    when 3
      "ごめんなさい"
    else
      "未告白"
    end
  end
end
