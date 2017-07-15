class SubscriberController < ApplicationController
  protect_from_forgery with: :null_session

  # GET /suscriber/new
  def new
    @subscriber = Subscriber.new

    domain = ENV["DOMAIN"]

    subscriber_id = SecureRandom.uuid
    subscriber_pass = SecureRandom.uuid[0..24] #OSOM BUG :(

    md5 = Digest::MD5.new
    md5.update (subscriber_id + ':' +  domain + ':' + subscriber_pass)
    ha1 = md5.hexdigest

    md5 = Digest::MD5.new
    md5.update (subscriber_id + '@' +  domain + ':' + domain + ':' + subscriber_pass)
    ha1b = md5.hexdigest

    @subscriber.username = subscriber_id
    @subscriber.password = subscriber_pass
    @subscriber.domain = domain
    @subscriber.ha1 = ha1
    @subscriber.ha1b = ha1b

    @subscriber.save!

    response = {
      "password" => subscriber_pass,
      "uri" => subscriber_id + '@' + domain,
      "ws"  => "wss://ws.callnow.tech:10443"
    }

    render :json => response.to_json

  end


end
