require 'csv'

namespace :db do
  desc "Drop, create, migrate then seed the City table"
  task :seed_city => :environment do 

  	CSV.foreach("#{Rails.root}/data/nj_muni_codes.csv") do |row|
			City.create!(
				:county_id=>row[0],
				:name=>row[1],
				:modifier=>row[2]
			)
		end
	end	
end