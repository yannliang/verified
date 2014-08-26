class Verified
  def self.check(mrzLine1, mrzLine2, returnData = false)
    @@Checker = Check.new
    @@Checker.check(mrzLine1, mrzLine2, returnData)
  end
end

require "verified/check"