class Townhall

	def scrap
		page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
		url = page.css('a[class = "lientxt"]').map {|e| 'http://annuaire-des-mairies.com/' + e['href'].gsub('./', '')}

		array = Array.new
		directories = Hash.new

		url.each {|urls|
			page = Nokogiri::HTML(open(urls))

			email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').map {|e| e.text }
			town = page.xpath('/html/body/div/main/section[1]/div/div/div/p[1]/strong[1]/a').map {|e| e.text.downcase.capitalize}
			directories = Hash[town.zip(email)]
			array << directories
		}

		puts array
	end

end