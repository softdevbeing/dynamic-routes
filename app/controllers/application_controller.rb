class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :scripts, :css

  before_filter :parse_domain, :parse_path

  def scripts
    ["#{ @domain }/application.js"]
  end

  def css
    ["#{ @domain }/application.css"]
  end

  private
  def parse_domain
    @domain = request.host.downcase
  end

  def parse_path
    @path = request.path
  end
end