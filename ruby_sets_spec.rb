require_relative "ruby_sets"

describe RubySet do
	before :each do
		@set = RubySet.new([1, 2, 3])
	end

	context 'union' do
		let(:set2) { [3, 3, 4, 5] }

		it 'returns set A if B is null' do
			expect(@set.union([])).to eq [1, 2, 3]
		end

		it 'returns single values for multivalued sets' do
			expect(@set.union([1, 2, 2, 2, 2, 3])).to eq [1,2,3]
		end

	it 'creates the union between two arrays' do
		#set2 = [3, 3, 4, 5]
		expect(@set.union(set2)).to eq [1, 2, 3, 4, 5]
	end

	end

	it 'creates the compliment of a - b' do
		
	end
end
