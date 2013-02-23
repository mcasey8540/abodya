require 'csv'

namespace :db do
  desc "Drop, create, migrate then seed the County table"
  task :seed_county => :environment do 

  	County.delete_all

  	CSV.foreach("#{Rails.root}/data/nj_counties.csv") do |row|
			County.create!(
				:state_id=>row[0],
				:name=>row[1],
			)
		end
	end	
end