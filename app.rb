require 'rubygems'
require 'sinatra'
require 'haml'
require 'yaml'

get '/' do
  haml :home, :locals => YAML::load(open('audio/options.yaml'))
end

get '/message' do  
  content_type :mp3
  response['Content-Disposition'] = 'attachment; filename=AnswerPhoneMessage.mp3'
  
  params[:intro]  = 'fintro1' if not File.exists?("audio/#{params[:intro]}.mp3")
  params[:mid]    = 'fmid1'   if not File.exists?("audio/#{params[:mid]}.mp3")
  params[:reason] = 'n2'      if not File.exists?("audio/#{params[:reason]}.mp3")
  params[:exit]   = 'fexit1'  if not File.exists?("audio/#{params[:exit]}.mp3")
  params[:flourish] = ' '  if not File.exists?("audio/#{params[:flourish]}.mp3")
  
  sequence = [params[:intro],params[:number].gsub(/[^0-9\ ]/," ").gsub(/\ +/," ")[0..32].strip.split(//),params[:mid],params[:reason],params[:exit],params[:flourish]].flatten
  
  sequence.each do |clip|
    response.write open("audio/#{clip}.mp3").read
  end
  response.finish
end