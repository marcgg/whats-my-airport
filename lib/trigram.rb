# encoding: utf-8

module Trigram
  def self.generate(name)
    return nil if name.nil?
    name = no_accents(name)
    words = name.split(" ")
    words = words.map{|w| w.split("-")}.flatten if [1,2].include? words.size
    case words.size
    when 1
      res = words.first[0..2]
    when 2
      res = "#{words[0][0]}#{words[1][0..1]}"
    when 3
      res = words.map{|w| w[0]}.join("")
    else
      res = generate(remove_small_words(name))
    end
    res.nil? ? nil : res.upcase
  end

  def self.remove_small_words(name)
    res = name.split(" ").select{|w| w.size > 2}
    res = [res[0], res[1], res.last] if res.size > 3
    res.join(" ")
  end

  def self.no_accents(str)	
		accents = {
		  ['á','à','â','ä','ã'] => 'a',
		  ['Ã','Ä','Â','À','�?'] => 'A',
		  ['é','è','ê','ë'] => 'e',
		  ['Ë','É','È','Ê'] => 'E',
		  ['í','ì','î','ï'] => 'i',
		  ['�?','Î','Ì','�?'] => 'I',
		  ['ó','ò','ô','ö','õ'] => 'o',
		  ['Õ','Ö','Ô','Ò','Ó'] => 'O',
		  ['ú','ù','û','ü'] => 'u',
		  ['Ú','Û','Ù','Ü'] => 'U',
		  ['ç'] => 'c', ['Ç'] => 'C',
		  ['ñ'] => 'n', ['Ñ'] => 'N'
		  }
		accents.each do |ac,rep|
		  ac.each do |s|
			str = str.gsub(s, rep)
		  end
		end
    str
	end
end
