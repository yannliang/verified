class Check
  def check(mrz_line_1, mrz_line_2)
    #make a new digit checker
    @@digit_checker = CheckDigit.new
    #string manipulation to simply reading the first line
    split = mrz_line_1.gsub(/<+/, '<').split('<')
    #get data unformatted from passport
    doc_data = Hash.new(9)
    #first line of MRZ
    doc_data["IssuingState"] = mrz_line_1[2...5]
    doc_data["LastName"] = split[1][3..-1]
    doc_data["FirstNames"] = split[2..-1]

    #second line of MRZ
    doc_data["Number"] = mrz_line_2[0...9]
    doc_data["Nationality"] = mrz_line_2[10...13]
    doc_data["DateOfBirth"] = mrz_line_2[13...19]
    doc_data["Gender"] = mrz_line_2[20]
    doc_data["ExpiryDate"] = mrz_line_2[21...27]
    doc_data["PersonalNumber"] = mrz_line_2[28...42]

    #mrz given check digits
    doc_check = Array.new
    doc_check[0] = mrz_line_2[9].to_s
    doc_check[1] = mrz_line_2[19].to_s
    doc_check[2] = mrz_line_2[27].to_s
    doc_check[3] = mrz_line_2[42].to_s
    doc_check[4] = mrz_line_2[43].to_s

    #calculate our own check digits
    our_check = Array.new
    our_check[0] = @@digit_checker.check_calc(mrz_line_2[0...9])
    our_check[1] = @@digit_checker.check_calc(mrz_line_2[13...19])
    our_check[2] = @@digit_checker.check_calc(mrz_line_2[21...27])
    our_check[3] = @@digit_checker.check_calc(mrz_line_2[28...42])
    our_check[4]	= @@digit_checker.check_calc(mrz_line_2[0...10]+mrz_line_2[13...20]+mrz_line_2[21...43])

    #the 4th check digit can be either > or 0, we always return 0 from our CheckDigit calc.
    #this basically changes our check to > so the true return can pass
    if our_check[3] == "0" && doc_check[3] == "<"
    	our_check[3] = "<"
    end
		
    return doc_data if doc_check.uniq.sort == our_check.uniq.sort
    return false
  end
end

class Check::CheckDigit
  def check_calc(str)
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