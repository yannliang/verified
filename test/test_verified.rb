require 'test/unit'
require 'verified'

class VerifiedTest < Test::Unit::TestCase
  def test_verified_check_valid_data
  teshHash = Hash.new
  testHash = {"IssuingState"=>"GBR", "LastName"=>"LAST", "FirstNames"=>["FIRST", "MIDDLE", "LION"], "Number"=>"123456789", "Nationality"=>"GBR", "DateOfBirth"=>"000101", "Gender"=>"M", "ExpiryDate"=>"100101", "PersonalNumber"=>"<<<<<<<<<<<<<<"}
  assert_equal testHash,
      Verified.check("P<GBRLAST<<FIRST<MIDDLE<LION<<<<<<<<<<<<<<<<", "1234567897GBR0001018M1001015<<<<<<<<<<<<<<00", true)
  end

  def test_verified_check_valid_no_data
  assert_equal true,
      Verified.check("P<GBRLAST<<FIRST<MIDDLE<LION<<<<<<<<<<<<<<<<", "1234567897GBR0001018M1001015<<<<<<<<<<<<<<00", false)
  end

  def test_verified_check_valid_no_data_not_specified
  assert_equal true,
      Verified.check("P<GBRLAST<<FIRST<MIDDLE<LION<<<<<<<<<<<<<<<<", "1234567897GBR0001018M1001015<<<<<<<<<<<<<<00")
  end

  def test_verified_check_valid_data_chevron
  teshHash = Hash.new
  testHash = {"IssuingState"=>"GBR", "LastName"=>"LAST", "FirstNames"=>["FIRST", "MIDDLE", "LION"], "Number"=>"123456789", "Nationality"=>"GBR", "DateOfBirth"=>"000101", "Gender"=>"M", "ExpiryDate"=>"100101", "PersonalNumber"=>"<<<<<<<<<<<<<<"}
  assert_equal testHash,
      Verified.check("P<GBRLAST<<FIRST<MIDDLE<LION<<<<<<<<<<<<<<<<", "1234567897GBR0001018M1001015<<<<<<<<<<<<<<<0", true)
  end

  def test_verified_check_valid_no_data_chevron
  assert_equal true,
      Verified.check("P<GBRLAST<<FIRST<MIDDLE<LION<<<<<<<<<<<<<<<<", "1234567897GBR0001018M1001015<<<<<<<<<<<<<<<0", false)
  end

  def test_verified_check_valid_no_data_not_specified_chevron
  assert_equal true,
      Verified.check("P<GBRLAST<<FIRST<MIDDLE<LION<<<<<<<<<<<<<<<<", "1234567897GBR0001018M1001015<<<<<<<<<<<<<<<0")
  end

  def test_verified_check_invalid_data
    assert_equal false,
      Verified.check("P<GBRLAST<<FIRST<MIDDLE<LION<<<<<<<<<<<<<<<<", "1234567897GBR0001018M1001015<<<<<<<<<<<<<<09", true)
  end

  def test_verified_check_invalid_no_data
  assert_equal false,
      Verified.check("P<GBRLAST<<FIRST<MIDDLE<LION<<<<<<<<<<<<<<<<", "1234567897GBR0001018M1001015<<<<<<<<<<<<<<09", false)
  end

  def test_verified_check_invalid_no_data_not_specified
  assert_equal false,
      Verified.check("P<GBRLAST<<FIRST<MIDDLE<LION<<<<<<<<<<<<<<<<", "1234567897GBR0001018M1001015<<<<<<<<<<<<<<09")
  end

  def test_verified_check_invalid_data_chevron
    assert_equal false,
      Verified.check("P<GBRLAST<<FIRST<MIDDLE<LION<<<<<<<<<<<<<<<<", "1234567897GBR0001018M1001015<<<<<<<<<<<<<<<9", true)
  end

  def test_verified_check_invalid_no_data_chevron
  assert_equal false,
      Verified.check("P<GBRLAST<<FIRST<MIDDLE<LION<<<<<<<<<<<<<<<<", "1234567897GBR0001018M1001015<<<<<<<<<<<<<<<9", false)
  end

  def test_verified_check_invalid_no_data_not_specified_chevron
  assert_equal false,
      Verified.check("P<GBRLAST<<FIRST<MIDDLE<LION<<<<<<<<<<<<<<<<", "1234567897GBR0001018M1001015<<<<<<<<<<<<<<<9")
  end
end