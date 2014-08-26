Verified
========

A simple Ruby Gem to verify MRZ codes on passports. Useful if you need to meet KYC or Money Laundering requirements.

Examples
------

```ruby
Verified.check("P<GBRLAST<<FIRST<MIDDLE<LION<<<<<<<<<<<<<<<<", "1234567897GBR0001018M1001015<<<<<<<<<<<<<<00")
```

would return

```ruby
true
```

```ruby
Verified.check("P<GBRLAST<<FIRST<MIDDLE<LION<<<<<<<<<<<<<<<<", "1234567897GBR0001018M1001015<<<<<<<<<<<<<<00", true)
```

would return

```ruby
{"IssuingState"=>"GBR", "LastName"=>"LAST", "FirstNames"=>["FIRST", "MIDDLE", "LION"], "Number"=>"123456789", "Nationality"=>"GBR", "DateOfBirth"=>"000101", "Gender"=>"M", "ExpiryDate"=>"100101", "PersonalNumber"=>"<<<<<<<<<<<<<<"}
```

Usage
------

Verified is used as above in the examples. It takes three arguments:

```
mrzLine1: The first line of a Passport MRZ (the long strip of text on the bottom). (string, required)
mrzLine2: The second line of a Passport MRZ (the long strip of text on the bottom). (string, required)
returnData: If true, returns a hash of information from the MRZ. (boolean, optional)
```

Installation
------

Verified is installed as a ruby gem like below

```ruby
gem install verified
```

License
------

Released under the MIT license for free usage with no warranty.
