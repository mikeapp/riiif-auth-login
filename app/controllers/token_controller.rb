class TokenController < ApplicationController

  def supply_token
    json = Hash.new
    json['accessToken'] = session[:iiif_auth]
    render json: json
  end

end
