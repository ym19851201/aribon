require 'spec_helper'
require './src/lake/lake'

lake = [
  ['W', '.', '.', '.', '.', '.', '.', '.', '.', 'W', 'W', '.'],
  ['.', 'W', 'W', 'W', '.', '.', '.', '.', '.', 'W', 'W', 'W'],
  ['.', '.', '.', '.', 'W', 'W', '.', '.', '.', 'W', 'W', '.'],
  ['.', '.', '.', '.', '.', '.', '.', '.', '.', 'W', 'W', '.'],
  ['.', '.', '.', '.', '.', '.', '.', '.', '.', 'W', '.', '.'],
  ['.', '.', 'W', '.', '.', '.', '.', '.', '.', 'W', '.', '.'],
  ['.', 'W', '.', 'W', '.', '.', '.', '.', '.', 'W', 'W', '.'],
  ['W', '.', 'W', '.', 'W', '.', '.', '.', '.', '.', 'W', '.'],
  ['.', 'W', '.', 'W', '.', '.', '.', '.', '.', '.', 'W', '.'],
  ['.', '.', 'W', '.', '.', '.', '.', '.', '.', '.', 'W', '.']
]

describe 'search_w' do
  it 'can search all "W" of lake' do
    expect(search_w(lake, 0, 9).sort).to eq [[0, 9], [0, 10], [1, 9], [1, 10], [1, 11], [2, 9], [2, 10], [3, 9], [3, 10], [4, 9], [5, 9], [6, 9], [6, 10], [7, 10], [8, 10], [9, 10]]
  end

  it 'can search all "W" of lake' do
    expect(search_w(lake, 0, 0).sort).to eq [[0, 0], [1, 1], [1, 2], [1, 3], [2, 4], [2, 5]]
  end

  it 'can search all "W" of lake' do
    expect(search_w(lake, 5, 2).sort).to eq [[5, 2], [6, 1], [6, 3], [7, 0], [7, 2], [7, 4], [8, 1], [8, 3], [9, 2]]
  end
end

describe 'count_puddle' do
  it 'can count the number of successive puddles' do 
    expect(count_puddle(lake)).to eq 3
  end
end
