# Verified
A simple Ruby Gem to verify MRZ codes on passports. Useful if you need to meet KYC or Money Laundering requirements.

## Usage
Check if a passport MRZ code is valid.

```ruby
Verified.check("P<GBRLAST<<FIRST<MIDDLE<LION<<<<<<<<<<<<<<<<", "1234567897GBR0001018M1001015<<<<<<<<<<<<<<00")
# => true
```
Do check and and return a hash of detailed information

```ruby
Verified.check("P<GBRLAST<<FIRST<MIDDLE<LION<<<<<<<<<<<<<<<<", "1234567897GBR0001018M1001015<<<<<<<<<<<<<<00", true)
# => {"IssuingState"=>"GBR", "LastName"=>"LAST", "FirstNames"=>["FIRST", "MIDDLE", "LION"], "Number"=>"123456789", "Nationality"=>"GBR", "DateOfBirth"=>"000101", "Gender"=>"M", "ExpiryDate"=>"100101", "PersonalNumber"=>"<<<<<<<<<<<<<<"}
```

## Installation
Verified is installed as a ruby gem

```ruby
gem install verified
```

Or add it to your project Gemfile

```ruby
gem "verified", "~> 0.0.1"
```

## License
Released under the MIT license for free usage with no warranty.
