require 'csv'

namespace :db do
  desc "Drop, create, migrate then seed the County table"
  task :seed_state => :environment do 

  	CSV.foreach("#{Rails.root}/data/us_states.csv") do |row|
			State.create!(
				:name=>row[0]			
				)
		end
	end	
end