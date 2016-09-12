class HomeController < ApplicationController

  before_action :authenticate_user!, :set_auth_cookie

  def index 
    render 'index'
  end

  def clear
    cookies.delete(:iiif_auth, origin: Rails.application.config.iiif_auth_domain)
    session.destroy
    render 'logout'
  end


  private

  def set_auth_cookie
    encryptor = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.iiif_key_base)
    encrypted = encryptor.encrypt_and_sign(current_user.id)
    # domain-level cookie
    cookies[:iiif_auth] = {
        value: encrypted,
        expires: 5.minutes.from_now,
        origin: Rails.application.config.iiif_auth_domain
    }
    # and in session
    session[:iiif_auth] = encrypted
  end

end
