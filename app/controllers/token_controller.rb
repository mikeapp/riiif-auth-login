require 'json'
class TokenController < ApplicationController

  def supply_token
    json = Hash.new
    json['accessToken'] = session[:iiif_auth]
    status = 401 if json['accessToken'].nil?
    json['messageId'] = params[:messageId] if params[:messageId]
    @domain = params[:domain]
    @values = JSON.unparse(json).html_safe
    status = 500 if @domain.nil?
    respond_to do |format|
      format.json { render json: json }
      format.html { render 'index' }
    end

  end

end
