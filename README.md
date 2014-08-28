# Verified
A simple Ruby Gem to verify and parse MRZ codes on passports. Useful if you need to meet KYC or Money Laundering requirements.

## Examples
Setup a new instance

```ruby
passport = Verified::Passport.new("P<GBRLAST<<FIRST<MIDDLE<LION<<<<<<<<<<<<<<<<", "1234567897GBR0001018M1001015<<<<<<<<<<<<<<00")
```

Now use it like this:

```ruby
passport.verified?
# => true
passport.LastName
# => LAST
passport.Gender
# => M
```

## Full Usage Documentation

Verified is used as above in the examples. It takes two arguments:

```
mrzLine1: The first line of a Passport MRZ (the long strip of text on the bottom). (string, required)
mrzLine2: The second line of a Passport MRZ (the long strip of text on the bottom). (string, required)
```

It then can be called using any of the folllowing methods:

```
verified? : Returns true if it's a valid passport MRZ, false if it's not.
IssuingState : Issuing country of the passport
LastName : Last name on the passport
FirstNames : Array of first names on the passport (First and any middle names)
Number : Passport Number
Nationality : Nationality of the person on the passport. Different from the issuing state (eg. Swedish person who is also a citizen of UK.)
DateOfBirth : Date of Birth, given as a Ruby Date object.
Gender : Gender, given as M, F or nil if not specified.
ExpiryDate : Expiy date of the passport, given as a Ruby Date object.
PersonalNumber : Personal number, if chosen to be given by issuer. Nil if not specified.
```
## Installation
Verified is installed as a ruby gem

```ruby
gem install verified
```

Or add it to your project Gemfile

```ruby
gem "verified", "~> 1.1.0"
```

## License and Credit
Released under the MIT license for free usage with no warranty.

Based on Document 9303 (Machine Readable Travel Documents - Part 1 - Machine Readable Passports. Volume 1 - Passports with Machine Readable Data Stored in Optical Character Recognition format) by the ICAO which can be found here:
http://www.icao.int/publications/pages/publication.aspx?docnum=9303

WARNING: THE ALGORITHM TO GENERATE VALID CHECK DIGITS ON MRZ'S IS PUBLIC.
BY USING VERIFIED YOU UNDERSTAND THIS CANNOT CONFIRM THE VALID ISSUE OF A PASSPORT,
BUT CAN CONFIRM IT WOULD BE AS THE ISSUE OF A VALID PASSPORT. USE THIS AS AN AID TO
KYC BUT NOT AS A COMPLETE SOLUTION.
