class CheckDigit
	def check(str)
  		str = str.strip.upcase
  		values = str.chars.map do |char|
    		case char
    		when '<'
    		  0
    		when 'A'..'Z'
    		  char.ord - 65 + 10
    		when '0'..'9'
    		  char.ord - 48
    		else
    		  raise "Unexpected character '#{char}'"
    		end
  		end
  	return (values.zip([7,3,1].cycle).map{|(v,w)| v * w}.reduce(:+) % 10).to_s
	end
end