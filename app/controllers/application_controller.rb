class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :scripts, :css

  before_filter :parse_domain, :parse_path

  # used to define only domain specific javascript files
  def scripts
    ["#{ @domain }/application.js"]
  end

  # used to define only domain specific css files
  def css
    ["#{ @domain }/application.css"]
  end

  private
  def parse_domain
    available_domains = %w{ www.refurbwarehousedeals.com www.koupon.co www.ziyuu.com }

    @domain = request.host.downcase
    @domain = available_domains.first unless available_domains.include? @domain
  end

  def parse_path
    @path = request.path
  end
end