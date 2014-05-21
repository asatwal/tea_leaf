# myapp.rb
require 'sinatra'

get '/acd' do
  "My Hello world! with params #{params[:a]} #{params[:b]}"
end