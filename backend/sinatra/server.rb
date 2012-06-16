#!/usr/bin/ruby

require 'rubygems'
require 'sinatra/base'
require 'json'
require 'models/heatmap'

ActiveRecord::Base.establish_connection(
	:adapter => "sqlite3",
	:database  => "db/heatmap.db",
	:pool => 25
)


class Position
	attr_accessor :x, :y

	def initialize(x, y)
		@x = x
		@y = y
	end

	def ==(another)
		return @x == another.x && @y == another.y
	end

	def to_s
		return "" + @x.to_s + " " + @y.to_s 
	end

end

class HeatMapWS < Sinatra::Base
	set :public_folder, File.expand_path('../../public')

	post '/receive' do
		if params[:type] == "click"
			heatmap = Heatmap.create(
					:url => params[:url],
					:time => params[:time],
					:x => params[:x],
					:y => params[:y],
					:button => params[:button],
					:referrer => params[:referrer]
			)
		end
	end

	get '/generate' do
		content_type :json

		
		data = []
		buckets = Hash.new {0}
		entries = Heatmap.find(:all, :conditions => { :url => params[:url] })
	
		entries.each do |entry|
			buckets[Position.new(entry.x, entry.y)] += 1
		end
	
		buckets.each do |position, count|
			data << { :count => count, :x => position.x, :y => position.y }
		end
    
		result = {
			:data => data,
			:max => buckets.values.max
		}
		return result.to_json
	end

	run! if app_file == $0
end
