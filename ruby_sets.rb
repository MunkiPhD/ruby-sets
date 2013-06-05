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


	def complement(setB)
		hash = Hash.new()
		@set.each do |item|
			hash[item] ||= 0
			hash[item] += 1
		end

		setB.each do |item|
			hash.delete(item)
		end

		hash.keys
	end

	def cartesian(setB)
		new_set = []
		@set.each do |a_item| 
			setB.each do |b_item|
				new_set << [a_item, b_item]
			end
		end

		new_set
	end
end	
