class CallbackController < ApplicationController
  protect_from_forgery with: :exception

  def index
    if params["hub.verify_token"] == "asd"
      render text: params["hub.challenge"]
    end
  end

  def received_data
    therequest = request.body.read
    data = JSON.parse(therequest)
    enteries = data["entry"]
    enteries.each do |entry|
      entry["messaging"].each do |messaging|
        sender = messaging ["sender"]["id"]
        text = messaging["message"]["text"]
        myjson = {"recipient": {"id": "#{sender}"}, "message": {"text": "text"}}
        puts HTTP.post(url, json: myjson)
      end
    end
    render "received_data"
  end


end
