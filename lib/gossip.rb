#!/usr/bin/ruby
# @Author: D1SH
# @Date:   2021-02-01 12:03:00
# @Last Modified by:   D1SH
# @Last Modified time: 2021-02-01 18:01:25
class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end #init

  def save
    CSV.open("./db/gossip.csv", "ab") do |gossip|
      gossip << ["Author: "+ " #{@author}",+ " " + "Gossip :" + " #{@content}"]
    end
  end #save

  def self.all  
	  @all_gossips = []
	  CSV.read("./db/gossip.csv").each do |csv_line|
	    @all_gossips << Gossip.new(csv_line[0], csv_line[1])
	  end
    return @all_gossips
  end #all

  def self.find(id)
	  return Gossip.all[id]
  end #find
  
end