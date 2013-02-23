require 'csv'

class CountyAssessment

	def initialize
		line_number = 0
		get_csv(line_number.to_i)
		#get_muni_code
	end

	def get_csv(line_number)

		CSV.foreach("#{Rails.root}/db/data/nj/bergen.csv") do |row|
	          		
		city = ""
       	case row[0].to_i
            when 201   
                  city = "Allendale "
            when 202    
                  city = "Alpine "
            when 203    
                  city = "Bergenfield "
            when 204    
                  city = "Bogota "
            when 205    
                  city = "Carlstadt "
            when 206    
                  city = "Cliffside Park" 
            when 207    
                  city = "Closter "
            when 208    
                  city = "Cresskill "
            when 209    
                  city = "Demarest "
            when 210    
                  city = "Dumont "
            when 212    
                  city = "East Rutherford " 
            when 213    
                  city = "Edgewater "
            when 211    
                  city = "Elmwood Park "
            when 214    
                  city = "Emerson "
            when 215    
                  city = "Englewood City"
            when 216    
                  city = "Englewood Cliffs "
            when 217    
                  city = "Fair Lawn "
            when 218    
                  city = "Fairview "
            when 219    
                  city = "Fort Lee "
            when 220    
                  city = "Franklin Lakes " 
            when 221    
                  city = "Garfield City"
            when 222    
                  city = "Glen Rock "
            when 223    
                  city = "Hackensack City "
            when 224    
                  city = "Harrington Park "
            when 225    
                  city = "Hasbrouck Heights " 
            when 226    
                  city = "Haworth "
            when 227    
                  city = "Hillsdale "
            when 228
                  city =  "Ho Ho Kus "
            when 229    
                  city = "Leonia "
            when 230    
                  city = "Little Ferry "
            when 231    
                  city = "Lodi "
            when 232    
                  city = "Lyndhurst Township"
            when 233    
                  city = "Mahwah Township"
            when 234    
                  city = "Maywood "
            when 235    
                  city = "Midland Park "
            when 236    
                  city = "Montvale "
            when 237
                  city =  "Moonachie "
            when 238
                  city = "New Milford "
            when 239    
                  city = "North Arlington "
            when 240    
                  city = "Northvale "
            when 241    
                  city = "Norwood "
            when 242    
                  city = "Oakland "
            when 243
                  city =  "Old Tappan "
            when 244    
                  city = "Oradell "
            when 245    
                  city = "Palisades Park " 
            when 246    
                  city = "Paramus "
            when 247    
                  city = "Park Ridge "
            when 248    
                  city = "Ramsey "
            when 249    
                  city = "Ridgefield "
            when 250    
                  city = "Ridgefield Park Village" 
            when 251    
                  city = "Ridgewood Village"
            when 252    
                  city = "River Edge"
            when 253    
                  city = "River Vale Township"
            when 254    
                  city = "Rochelle Park Township" 
            when 255    
                  city = "Rockleigh "
            when 256    
                  city = "Rutherford "
            when 257    
                  city = "Saddle Brook Township"
            when 258    
                  city = "Saddle River "
            when 259    
                  city = "South Hackensack Twp."
            when 260    
                  city = "Teaneck Township"
            when 261    
                  city = "Tenafly "
            when 262    
                  city = "Teterboro "
            when 263    
                  city = "Upper Saddle River" 
            when 264    
                  city = "Waldwick "
            when 265    
                  city = "Wallington "
            when 266    
                  city = "Washington Township"
            when 267    
                  city = "Westwood "
            when 268    
                  city = "Woodcliff Lake" 
            when 269    
                  city = "Wood-Ridge "
            when 270    
                  city = "Wyckoff Township"
            else   
           	      city =  "UNKNOWN"
            end

		#if line_number > 224114 
			Assessment.create!(
				:state=>"New Jersey",
				:county=>"Bergen",
				:municipality=>city,
				:property_location=>row[4], 
				:property_class=>row[5], 
				:owner_name=>row[6], 
				:owner_mailing =>row[7], 
				:city_state_zip=>row[8], 
				:square_feet=>row[9], 
				:year_built=>row[10], 
				:building_class=>row[11], 
				:updated=>row[15], 
				:acreage=>row[29], 
				:taxes_one=>row[37], 
				:taxes_two=>row[38], 
				:taxes_three=>row[39], 
				:taxes_four=>row[40], 
				:sale_date=>row[41], 
				:sale_price=>row[44], 
				:assessed=>row[56] 
			)
		puts "#{line_number} #{city}"
		#end
	line_number += 1
	end

	end

	# def get_muni_code
	# 	CSV.foreach("/Users/michaelcasey/Desktop/Code/abodya/county_data/nj_muni_codes.csv") do |row|
	# 		MuniCode.create!(
	# 			:county=>row[0],
	# 			:city=>row[1],
	# 			:muni_code=>row[2]
	# 		)
	# 	end
	# end

end

n = CountyAssessment.new

#Monmouth Municipal Codes
            # when 1301 
            #       city =  "Aberdeen Township" 
            # when 1302 
            #       city =  "Allenhurst " 
            # when 1303 
            #       city =  "Allentown " 
            # when 1304 
            #       city =  "Asbury Park City" 
            # when 1305 
            #       city =  "Atlantic Highlands Bor." 
            # when 1306 
            #       city =  "Avon-by-the-Sea Bor."
            # when 1307 
            #       city =  "Belmar "
            # when 1308 
            #       city =  "Bradley Beach "
            # when 1309 
            #       city =  "Brielle "
            # when 1310 
            #       city =  "Colts Neck Township"
            # when 1311   
            #       city =  "Deal "
            # when 1312 
            #       city =  "Eatontown "
            # when 1313 
            #       city =  "Englishtown "
            # when 1314 
            #       city =  "Fair Haven "
            # when 1315 
            #       city =  "Farmingdale "
            # when 1316 
            #       city =  "Freehold "
            # when 1317 
            #       city =  "Freehold Township"
            # when 1318 
            #       city =  "Hazlet Township"
            # when 1319 
            #       city =  "Highlands "
            # when 1320 
            #       city =  "Holmdel Township"
            # when 1321 
            #       city =  "Howell Township"
            # when 1322 
            #       city =  "Interlaken "
            # when 1323 
            #       city =  "Keansburg "
            # when 1324 
            #       city =  "Keyport "
            # when 1346 
            #       city =  "Lake Como "
            # when 1325 
            #       city =  "Little Silver "
            # when 1326 
            #       city =  "Loch Arbour Village"
            # when 1327 
            #       city =  "Long Branch City"
            # when 1328 
            #       city =  "Manalapan Township"
            # when 1329 
            #       city =  "Manasquan "
            # when 1330 
            #       city =  "Marlboro Township"
            # when 1331 
            #       city =  "Matawan "
            # when 1332 
            #       city =  "Middletown Township"
            # when 1333 
            #       city =  "Millstone Township"
            # when 1334 
            #       city =  "Monmouth Beach "
            # when 1336 
            #       city =  "Neptune City "
            # when 1335 
            #       city =  "Neptune Township"
            # when 1337 
            #       city =  "Ocean Township"
            # when 1338 
            #       city =  "Oceanport "
            # when 1339 
            #       city =  "Red Bank "
            # when 1340 
            #       city =  "Roosevelt "
            # when 1341 
            #       city =  "Rumson "
            # when 1342 
            #       city =  "Sea Bright "
            # when 1343 
            #       city =  "Sea Girt "
            # when 1344 
            #       city =  "Shrewsbury "
            # when 1345 
            #       city =  "Shrewsbury Township"
            # when 1347 
            #       city =  "Spring Lake "
            # when 1348 
            #       city =  "Spring Lake Heights Bor."
            # when 1349 
            #       city =  "Tinton Falls "
            # when 1350 
            #       city =  "Union Beach "
            # when 1351 
            #       city =  "Upper Freehold Township"
            # when 1352 
            #       city =  "Wall Township"
            # when 1353 
            #       city =  "West Long Branch Boro"




