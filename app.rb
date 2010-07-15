require 'rubygems'
require 'sinatra'
require 'haml'

get '/' do
  haml :home
end

get '/message' do  
  content_type :mp3
  
  out = ""
  ["intro",params[:number].gsub(/[^0-9\ ]/," ").gsub(/\ +/," ").strip.split(//),"mid",params[:reason] || 'c',"exit"].flatten.each do |clip|
    out << open("audio/#{clip}.mp3").read
  end
  #response.finish
  out
end