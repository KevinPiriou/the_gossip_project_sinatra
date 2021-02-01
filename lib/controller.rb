#!/usr/bin/ruby
# @Author: D1SH
# @Date:   2021-02-01 11:17:07
# @Last Modified by:   D1SH
# @Last Modified time: 2021-02-01 18:04:10
require 'gossip'


class ApplicationController < Sinatra::Base
  get '/' do  
	  erb :index, locals: {gossips: Gossip.all} #HOME PAGE #Local method. Declare array in Gossip.all
  end
  
  get '/gossips/new/' do #CREATE FORMULAR FOR NEW GOSSIP
    erb :new_gossip
  end
  
  post '/gossips/new/' do #SAVE NEW GOSSIP IN ARRAY + REDIRECT HOME PAGE
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

   get '/gossips/:id/' do #SHOW ALL GOSSIP FROM DB.csv
    erb :show, locals: {show: Gossip.all[params[:id].to_i], id: params[:id].to_i}
 end
 
 
end 