Gem::Specification.new do |s|
  s.name        = 'verified'
  s.version     = '0.1'
  s.date        = '2014-08-26'
  s.summary     = "Really simple passport verification."
  s.description = "A simple gem to verify MRZ codes on passports. Useful if you need to comply with KYC or Money Laundering ID checks."
  s.authors     = ["Ruby"]
  s.email       = 'ruby@mewmew.io'
  s.files       = ["lib/verified.rb", "lib/verified/check.rb", "lib/verified/checkdigit.rb"]
  s.homepage    =
    'http://github.com/rubyisilluminati/verified'
  s.license       = 'MIT'
end