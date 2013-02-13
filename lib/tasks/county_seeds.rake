require 'csv'

namespace :db do
  desc "Drop, create, migrate then seed the County table"
  task :seed_county => :environment do 

  	CSV.foreach("#{Rails.root}/data/counties.csv") do |row|
			County.create!(
				:state_id=>row[0],
				:name=>row[1],
			)
		end
	end	
end