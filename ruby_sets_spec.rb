require_relative "ruby_sets"

describe RubySet do
	before :each do
		@setA = RubySet.new([1, 2, 3])
	end

	context 'union' do
		let(:set2) { [3, 3, 4, 5] }

		it 'returns set A if B is null' do
			expect(@setA.union([])).to eq [1, 2, 3]
		end

		it 'returns single values for multivalued sets' do
			expect(@setA.union([1, 2, 2, 2, 2, 3])).to eq [1,2,3]
		end

		it 'creates the union between two arrays' do
			#set2 = [3, 3, 4, 5]
			expect(@setA.union(set2)).to eq [1, 2, 3, 4, 5]
		end
	end

	context 'complement' do
		let(:setB) { [3, 4, 5] }

		it 'with no intersecting values, returns values from set A' do
			setA = RubySet.new([1, 2])
			setB = RubySet.new(['red', 'white'])
			result = setA.complement(setB.set)

			expect(result).to eq [1, 2]
		end

		it 'with no intersecting values, returns set A' do
			expect(@setA.complement([5, 6, 7])).to eq [1, 2, 3]
		end


		it 'with one intersecting value, returns values from A without that value' do
			expect(@setA.complement(setB)).to eq [1, 2]
		end


		it 'with same values, returns empty array' do
			expect(@setA.complement([1, 2, 3])).to eq []
		end
	end

	
	context 'cartesian product' do
		let(:setA) { RubySet.new([1, 2, 'green']) }
		let(:setB) { ['red', 'white', 'green'] }

		it 'returns a subset with each possible value of A x B' do
			result = setA.cartesian(setB)

			expect(result).to eq [[1, 'red'], [1, 'white'], [1, 'green'], [2, 'red'], [2, 'white'], [2, 'green'], ['green', 'red'], ['green', 'white'], ['green', 'green']]
		end


		it 'is disjoint if set B is empty' do
			expect(setA.cartesian([])).to eq []
		end
	end
end
