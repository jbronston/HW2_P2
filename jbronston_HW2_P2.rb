# Joshua Bronston
# ECE 595
# Homework #2
# Problem 2
#File: jbronston_HW2_P2.rb

# Start Ruby and create the database with the following command
#
# irb -r ./jbronston_HW2_P2.rb

# Add to the data with the following command 
#
# Task.new(:task_name=>"Due Homework", :due_date=>"2012-09-28", :complete=>"false").save

require "active_record"

#Adapter for the SQLite3
ActiveRecord::Base::establish_connection(:adapter => "sqlite3",
		  :database => "reminderdb.sqlite")

#Define database schema, and create database "tasks"
class TaskTableScript < ActiveRecord::Migration
	def self.up
		create_table :tasks do |t|
			t.string	:task_name
			t.date	:due_date
			t.boolean	:complete
		end
	end

	def self.down
		drop_table :tasks
	end
end

#create the table that will be userd in the database
TaskTableScript.up

class Task < ActiveRecord::Base
end
