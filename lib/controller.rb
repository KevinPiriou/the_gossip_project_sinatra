#!/usr/bin/ruby
# @Author: D1SH
# @Date:   2021-02-01 11:17:07
# @Last Modified by:   D1SH
# @Last Modified time: 2021-02-01 17:49:13
require 'gossip'


class ApplicationController < Sinatra::Base
  get '/' do  
	  erb :index, locals: {gossips: Gossip.all} #Local method. Declare array in Gossip.all
  end
  
  get '/gossips/new/' do
    erb :new_gossip
  end
  
  post '/gossips/new/' do 
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect'/'
  end
  
  # post '/gossips/new/' do
  #   puts "Initialize..".green.bold
  #   puts "PARAMS :".green.bold + "#{params}"
  #   puts "Gossip Author :".green.bold + "#{params["gossip_author"]}"
  #   puts "Gossip Content :".green.bold + "#{params["gossip_content"]}"
  #   puts "Gossip end".yellow.bold
  #  end

   get '/gossips/:id/' do 
    erb :show, locals: {show: Gossip.all[params[:id].to_i], id: params[:id].to_i}
 end
 
 
end 