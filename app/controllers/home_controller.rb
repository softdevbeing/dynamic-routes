class HomeController < ApplicationController
  def welcome
    @path = 'index.html' if @path.gsub('/', '').blank?
    view_path = File.join @domain, @path

    render view_path
  end
end
