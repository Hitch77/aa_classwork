require 'rspec'
require 'first_tdd_projects'

describe 'remove_dups' do
    it "should accept an array as an argument" do
        expect {remove_dups([1, 2, 1, 3, 3])}.to_not raise_error
    end

    it "should return a new array with elements in sequential order" do
        expect(remove_dups([1, 3, 2])).to eq([1, 2, 3])
        expect(remove_dups([4, 2])).to eq([2, 4])
        expect(remove_dups([1, 1, 1, 1, 1])).to eq([1])
    end

    it "should return a new array without duplicates" do
        expect(remove_dups([1, 2, 1, 3, 3])).to eq([1, 2, 3])
        expect(remove_dups([9, 4, 2, 6, 8])).to eq([2, 4, 6, 8, 9])
        expect(remove_dups([1, 1, 1, 1, 1])).to eq([1])
    end
end

describe "Array" do
    describe '#two_sum' do
        it 'should accept an array as an argument' do
            expect {([-1, 0, 2, -2, 1]).two_sum}.to_not raise_error
        end

        it 'should return a 2D array of pairs as a dictionary from the given array' do
            expect(([-1, 0, 2, -2, 1]).two_sum).to eq([[0, 4], [2, 3]])
            expect(([4, -4, 2, -2, 3]).two_sum).to eq([[0, 1], [2, 3]])
            expect(([9, 2, -3, 4, 3]).two_sum).to eq([[2, 4]])
            expect(([-1, 2, 1, -2, 3]).two_sum).to eq([[0, 2], [1, 3]])
        end
    end
end

describe 'my_transpose' do
    it 'should accept a 2D array as an argument' do
        expect {my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]])}.to_not raise_error
    end

    it 'should return the array transposed' do
        expect(my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]])).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end
end

describe 'stock_picker' do
    it "should accept an array as an argument" do
        expect {stock_picker([600, 11, 300, 16, 4000, 31, 601, 2])}.to_not raise_error
    end

    it 'should return the most profitable day pairs' do 
        expect(stock_picker([1, 2, 1, 3, 3])).to eq([0, 3])
        expect(stock_picker([9, 4, 2, 6, 8])).to eq([2, 4])
        expect(stock_picker([600, 11, 300, 16, 4000, 31, 601, 2])).to eq([1, 4])        
    end
end
