class RubySet
	attr_accessor :set

	def initialize(arr)
		arr ||= []
		@set = arr
	end

	def union(set2)
		hash = Hash.new()
		@set.each do |item|
			hash[item] = nil
		end

		set2.each do |item|
			hash[item] = nil
		end

		return hash.keys
	end
end	
