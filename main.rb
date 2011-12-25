require "rubygems"
require "awesome_print"
require "nokogiri"
require 'open-uri'

puts "ALL GOOD"

airports = []

('a'..'z').each do |letter|
  puts "Fetching #{letter}"
  site = "http://www.world-airport-codes.com/alphabetical/country-name/#{letter}.html"
  doc = Nokogiri::HTML(open(site))
  tr_count = 0
  doc.xpath("//tr").each do |tr|
    i = 0
    next if tr.children.first.to_s == "<td><b>Country Name</b></td>"
    tr.children.each do |td|
      case i
      when 0
        airports[tr_count] = {:country => td.to_s.gsub(/<(\/)?td>/, "")}
      when 3
        airport = td.to_s.gsub(/<(\/)?td>/, "")
        airport =~ />([\w\s\-]*)</
        airports[tr_count].merge!(:airport => $1)
      when 9
        airports[tr_count].merge!(:code => td.to_s.gsub(/<(\/)?td>/, ""))
      end
      i += 1
    end
    tr_count += 1
  end
end

puts airports.size
