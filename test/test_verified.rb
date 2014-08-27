require 'test/unit'
require 'verified'

class VerifiedTest < Test::Unit::TestCase
  def test_verified_check_valid_data
    tesh_hash = Hash.new
    test_hash = {"IssuingState"=>"GBR", "LastName"=>"LAST", "FirstNames"=>["FIRST", "MIDDLE", "LION"], "Number"=>"123456789", "Nationality"=>"GBR", "DateOfBirth"=>Date.parse("2000-01-01"), "Gender"=>"M", "ExpiryDate"=>Date.parse("2010-01-01"), "PersonalNumber"=>""}
    passport = Verified::Passport.new("P<GBRLAST<<FIRST<MIDDLE<LION<<<<<<<<<<<<<<<<", "1234567897GBR0001018M1001015<<<<<<<<<<<<<<00")
    test_hash.each do |key, value|
      assert_equal test_hash[key],
        passport.send("#{key}".to_sym)
    end
  end

  def test_verified_check_valid_data_chevron
    tesh_hash = Hash.new
    test_hash = {"IssuingState"=>"GBR", "LastName"=>"LAST", "FirstNames"=>["FIRST", "MIDDLE", "LION"], "Number"=>"123456789", "Nationality"=>"GBR", "DateOfBirth"=>Date.parse("2000-01-01"), "Gender"=>"M", "ExpiryDate"=>Date.parse("2010-01-01"), "PersonalNumber"=>""}
    passport = Verified::Passport.new("P<GBRLAST<<FIRST<MIDDLE<LION<<<<<<<<<<<<<<<<", "1234567897GBR0001018M1001015<<<<<<<<<<<<<<00")
    test_hash.each do |key, value|
      assert_equal test_hash[key],
        passport.send("#{key}".to_sym)
    end
  end

  def test_verified_check_invalid_data
    passport = Verified::Passport.new("P<GBRLAST<<FIRST<MIDDLE<LION<<<<<<<<<<<<<<<<", "1234567897GBR0001018M1001015<<<<<<<<<<<<<<09")
    assert_equal false,
      passport.verified?
  end

  def test_verified_check_invalid_data_chevron
    passport = Verified::Passport.new("P<GBRLAST<<FIRST<MIDDLE<LION<<<<<<<<<<<<<<<<", "1234567897GBR0001018M1001015<<<<<<<<<<<<<<<9")
    assert_equal false,
      passport.verified?
  end
end