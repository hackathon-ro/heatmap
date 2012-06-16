#!/usr/bin/ruby

require "active_record"
require "sqlite3"
require "../models/heatmap"


ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.colorize_logging = false

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database  => "heatmap.db"
)

ActiveRecord::Schema.define do
	create_table :heatmaps do |table|
		table.column :url, :string
		table.column :x, :integer, :null => false
		table.column :y, :integer, :null => false
		table.column :time, :datetime
		table.column :button, :integer, :null => false
		table.column :referrer, :string
	end
end


