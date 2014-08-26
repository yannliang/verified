class Check
	def check(mrzLine1, mrzLine2, returnInfo = false)
		#make a new digit checker
		@@DigitChecker = CheckDigit.new
		#string manipulation to simply reading the first line
		split1 = mrzLine1.gsub(/<+/, '<').split('<')
		#get data unformatted from passport
		docData = Hash.new(9)
		#first line of MRZ
		docData["IssuingState"] = mrzLine1[2...5]
		docData["LastName"] = split1[1][3..-1]
		docData["FirstNames"] = split1[2..-1]

		#second line of MRZ
		docData["Number"] = mrzLine2[0...9]
		docData["Nationality"] = mrzLine2[10...13]
		docData["DateOfBirth"] = mrzLine2[13...19]
		docData["Gender"] = mrzLine2[20]
		docData["ExpiryDate"] = mrzLine2[21...27]
		docData["PersonalNumber"] = mrzLine2[28...42]

		#mrz given check digits
		docCheck = Array.new
		docCheck[0] = mrzLine2[9].to_s
		docCheck[1] = mrzLine2[19].to_s
		docCheck[2] = mrzLine2[27].to_s
		docCheck[3] = mrzLine2[42].to_s
		docCheck[4] = mrzLine2[43].to_s

		#calculate our own check digits
		ourCheck = Array.new
		ourCheck[0] = @@DigitChecker.checkCalc(mrzLine2[0...9])
		ourCheck[1] = @@DigitChecker.checkCalc(mrzLine2[13...19])
		ourCheck[2] = @@DigitChecker.checkCalc(mrzLine2[21...27])
		ourCheck[3] = @@DigitChecker.checkCalc(mrzLine2[28...42])
		ourCheck[4]	= @@DigitChecker.checkCalc(mrzLine2[0...10]+mrzLine2[13...20]+mrzLine2[21...43])

		#the 4th check digit can be either > or 0, we always return 0 from our CheckDigit calc.
		#this basically changes our check to > so the true return can pass
		if ourCheck[3] == "0" && docCheck[3] == "<"
			ourCheck[3] = "<"
		end

		return docData if docCheck.uniq.sort ==	ourCheck.uniq.sort && returnInfo == true
		return true if docCheck.uniq.sort == ourCheck.uniq.sort
		return false
	end
end

class Check::CheckDigit
	def checkCalc(str)
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