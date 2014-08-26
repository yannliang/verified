Verified = Class.new
class Verified::Passport
  def initialize(mrz_line_1, mrz_line_2)
    checker = Check.new
    @data = checker.check(mrz_line_1, mrz_line_2)
  end

  def verified?
    return false if @data == false
  	return true
  end

  def method_missing(name, *args, &blk)
    if args.empty? && blk.nil? && @data.has_key?(name.to_s)
      @data[name.to_s]
    else
      super
    end
  end
end

require "verified/check"