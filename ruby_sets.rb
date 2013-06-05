class RubySet
	attr_accessor :set

	#
	# arr = the array of items in the set
	#
	def initialize(arr)
		arr ||= []
		@set = arr
	end


	# 
	# Returns an array of the union of the current set and the passed in set (unique values of the two)
	#
	def union(setB)
		hash = Hash.new()
		@set.each do |item|
			hash[item] = nil
		end

		setB.each do |item|
			hash[item] = nil
		end

		return hash.keys
	end


	#
	# returns an array with the complement of the current set and the argument array passed
	#
	def complement(setB)
		hash = Hash.new()

		# add each item from the current set to a hash
		@set.each do |item|
			hash[item] ||= nil # we dont need to set anything here, we just want to keep track if it exists, so set it to nil
		end

		# then if it exists in the passed in set, remove it from the hash because we want whats in set A and NOT in set B
		setB.each do |item|
			hash.delete(item)
		end

		hash.keys
	end


	#
	# Returns an array of arrays of the cartesian product of the current set and the array set passed in
	#
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
