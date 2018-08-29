class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CurrentCart
  layout :set_layout
  before_action :set_cart

  

  private
  def set_layout
  	devise_controller? ? 'admin' : 'application'
  end
end
