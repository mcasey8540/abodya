require 'nokogiri'
require 'open-uri'

class MorrisCountyScraper

	def initialize
		#Q,Z,Y, A
		@alpha_array = ["B"]
		@record_url_array = []
		@record_detail_url_array = []
		@property_data_detail_array = []
		generate_urls
	end

	def generate_urls
		@alpha_array.each do |letter|
			@record_url_array << "http://mcweb1.co.morris.nj.us/TaxBoard/TTROwnerNameSearch.jsp?TaxYear=2012&District=00&OwnersName=#{letter}"
		end
		fetch_property_detail_urls(@record_url_array)
	end

	def fetch_property_detail_urls(record_url_array)
		@record_url_array.each do |url|
			doc = Nokogiri::HTML(open(url))
			count = 0
			array = []
			array_2 = []

			doc.css('script').each_with_index do |line, index|
				if index == 2 
					array << line.content
				end
			end

			new_array = array[0].split(/\n/)

			new_array.each do |value|
				if value.include? "["
					array_2 << value
				end
			end

			array_2.each_with_index do |x,i|
				if i > 5 
					entry = x.split(",")
					if entry.size == 20
							url = "#{entry[6]}"
						elsif entry.size == 21 
							url = "#{entry[7]}" 
						elsif entry.size == 22 and ( (entry[6].include? "1" ) ||  (entry[6].include? "2") || (entry[6].include? "3") || (entry[6].include? "4") || (entry[6].include? "5") || (entry[6].include? "6") || (entry[6].include? "7") || (entry[6].include? "8") || (entry[6].include? "9") )
							url = "#{entry[8]}"
						elsif entry.size == 22 
							url = "#{entry[8]}"
						elsif entry.size == 23
							url = "#{entry[9]}"
					end
					@record_detail_url_array << "http://mcweb1.co.morris.nj.us/TaxBoard/#{url.split('"')[1]}"
				end
			end
		end
		fetch_property_details
	end

	def fetch_property_details
		@record_detail_url_array.each do |record_url|

			puts record_url

			node_array = []
			node_string = " "
			clean_node_array = []

			doc = Nokogiri::HTML(open(record_url))

			doc.xpath("//div[@id='THead']").each do |node|
				node_string += node.content
			end 

			doc.xpath("//div[@id='T11']").each do |node|
				node_string += node.content
			end 

			doc.xpath("//div[@id='T12']").each do |node|
				node_string += node.content
			end 

			doc.xpath("//div[@id='T14']").each do |node|
				node_string += node.content
			end 

			doc.xpath("//div[@id='T15']").each do |node|
				sale_array = []
				@number_of_sales = 0
				node_string += node.content
				sale_array = node.content.split("\n")
				sale_array.each do |t|
					if t.include? "$"
						@number_of_sales += 1
					end
				end  
			end 

			node_array = node_string.split("\n")

			node_array.each do |node|
				clean_node_array << node.strip.rstrip
			end

			case @number_of_sales
			when 1
				sale_price_one = clean_node_array[117].gsub(/[$]*[,]*/,"")
				deed_date_one  = clean_node_array[118]
			when 2
				sale_price_one = clean_node_array[117].gsub(/[$]*[,]*/,"")
				deed_date_one  = clean_node_array[118]
				sale_price_two = clean_node_array[123].gsub(/[$]*[,]*/,"")
				deed_date_two  = clean_node_array[124]
			when 3
				sale_price_one = clean_node_array[117].gsub(/[$]*[,]*/,"")
				deed_date_one  = clean_node_array[118]
				sale_price_two = clean_node_array[123].gsub(/[$]*[,]*/,"")
				deed_date_two  = clean_node_array[124]
				sale_price_three = clean_node_array[129].gsub(/[$]*[,]*/,"")
				deed_date_three  = clean_node_array[130]
			when 4
				sale_price_one = clean_node_array[117].gsub(/[$]*[,]*/,"")
				deed_date_one  = clean_node_array[118]
				sale_price_two = clean_node_array[123].gsub(/[$]*[,]*/,"")
				deed_date_two  = clean_node_array[124]
				sale_price_three = clean_node_array[129].gsub(/[$]*[,]*/,"")
				deed_date_three  = clean_node_array[130]
				sale_price_four = clean_node_array[135].gsub(/[$]*[,]*/,"")
				deed_date_four  = clean_node_array[136]
			when 5
				sale_price_one = clean_node_array[117].gsub(/[$]*[,]*/,"")
				deed_date_one  = clean_node_array[118]
				sale_price_two = clean_node_array[123].gsub(/[$]*[,]*/,"")
				deed_date_two  = clean_node_array[124]
				sale_price_three = clean_node_array[129].gsub(/[$]*[,]*/,"")
				deed_date_three  = clean_node_array[130]
				sale_price_four = clean_node_array[135].gsub(/[$]*[,]*/,"")
				deed_date_four  = clean_node_array[136]
				sale_price_five = clean_node_array[141].gsub(/[$]*[,]*/,"")
				deed_date_five = clean_node_array[142]
			when 6
				sale_price_one = clean_node_array[117].gsub(/[$]*[,]*/,"")
				deed_date_one  = clean_node_array[118]
				sale_price_two = clean_node_array[123].gsub(/[$]*[,]*/,"")
				deed_date_two  = clean_node_array[124]
				sale_price_three = clean_node_array[129].gsub(/[$]*[,]*/,"")
				deed_date_three  = clean_node_array[130]
				sale_price_four = clean_node_array[135].gsub(/[$]*[,]*/,"")
				deed_date_four  = clean_node_array[136]
				sale_price_five = clean_node_array[141].gsub(/[$]*[,]*/,"")
				deed_date_five = clean_node_array[142]
				sale_price_six = clean_node_array[147].gsub(/[$]*[,]*/,"")
				deed_date_six = clean_node_array[148]
			end		

			@property_data_detail_array << Hash["Tax Year", clean_node_array[2], 
														"County", clean_node_array[4],
														"State", "NJ", 
														"District", clean_node_array[6],
														"Last Updated", clean_node_array[15],
														"Owner Name", clean_node_array[18],
														"Owner Street", clean_node_array[20],
														"Owner City State", clean_node_array[22],
														"Owner Zip Code", clean_node_array[24],
														"Property Location", clean_node_array[46],
														"Acerage", clean_node_array[50],
														"Year Constructed", clean_node_array[72],
														"Building Square Feet", clean_node_array[75],
														"Land Value", clean_node_array[96].gsub(/[$]*[,]*/,""),
														"Improvement Value", clean_node_array[99].gsub(/[$]*[,]*/,""),
														"Net Taxable Value", clean_node_array[102].gsub(/[$]*[,]*/,""),
														"Prior Year Tax", clean_node_array[105].gsub(/[$]*[,]*/,""),
														"Current Year Tax", clean_node_array[108].gsub(/[$]*[,]*/,""),
														"Sales Price 1", sale_price_one,
														"Deed Date 1", deed_date_one,
														"Sales Price 2", sale_price_two,
														"Deed Date 2", deed_date_two,
														"Sales Price 3", sale_price_three,
														"Deed Date 3", deed_date_three,
														"Sales Price 4", sale_price_four,
														"Deed Date 4", deed_date_four,
														"Sales Price 5", sale_price_five,
														"Deed Date 5", deed_date_five,
														"Sales Price 6", sale_price_six,
														"Deed Date 6", deed_date_six
													]								
		end
		seed_property_model
	end

	def seed_property_model
		@property_data_detail_array.each do |property|
			Property.create!(
								:tax_year =>property["Tax Year"],
								:county =>property["County"],
								:state =>property["State"],
								:district =>property["District"],
								:last_updated =>property["Last Updated"],
								:owner_name =>property["Owner Name"],
								:owner_street =>property["Owner Street"],
								:owner_city_state =>property["Owner City State"],
								:owner_zip_code =>property["Owner Zip Code"],
								:property_location =>property["Property Location"],
								:acerage =>property["Acerage"],
								:year_constructed =>property["Year Constructed"],
								:building_square_feet =>property["Building Square Feet"],
								:land_value =>property["Land Value"],
								:improvement_value =>property["Improvement Value"],
								:net_taxable_value =>property["Net Taxable Value"],
								:prior_year_tax =>property["Prior Year Tax"],
								:curret_year_tax =>property["Current Year Tax"],
								:sale_price_one =>property["Sales Price 1"],
								:deed_date_one =>property["Deed Date 1"],
								:sale_price_two =>property["Sales Price 2"],
								:deed_date_two =>property["Deed Date 2"],
								:sale_price_three =>property["Sales Price 3"],
								:deed_date_three =>property["Deed Date 3"],
								:sale_price_four =>property["Sales Price 4"],
								:deed_date_four =>property["Deed Date 4"],
								:sale_price_five =>property["Sales Price 5"],
								:deed_date_five =>property["Deed Date 5"],
								:sale_price_six =>property["Sales Price 6"],
								:deed_date_six =>property["Deed Date 6"]
					)
		end
	end

end

n = MorrisCountyScraper.new




