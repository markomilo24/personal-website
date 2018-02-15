class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  require "open-uri"
  require "json"
  
  def homesweethome
    #require 'open-url'
    
    instagram = open("https://www.instagram.com/picsbymilo/?__a=1")
    
    doc = ""
    instagram.each do |line|
      doc << line
    end
    instagram.close

    resp = JSON.parse(doc)
    
    @image_links = Array.new
    @image_captions = Array.new
    
    nodes =  resp['user']['media']['nodes']
    
    nodes.each do |node|
      @image_links.push(node['display_src'])
      @image_captions.push(node['caption'])
    end
    
  end
end
