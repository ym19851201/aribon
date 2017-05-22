require 'set'

def search_w(lake, row, col, points = Set.new)
  return if out_of_bounds?(lake, row, col)
  return unless lake[row][col] == 'W'

  points.add [row, col]

  search_w(lake, row, col + 1, points)
  search_w(lake, row + 1, col, points)
  search_w(lake, row + 1, col + 1, points)
  search_w(lake, row + 1, col - 1, points)

  points
end

def out_of_bounds?(lake, row, col)
  row < 0 || row > lake.length - 1 || col < 0 || col > lake[row].length - 1
end

def searched?(lake, i, j)
  w?(lake, i, j - 1) || w?(lake, i - 1, j - 1) ||
    w?(lake, i - 1, j) || w?(lake, i - 1, j + 1)
end

def w?(lake, i, j)
  !out_of_bounds?(lake, i, j) && lake[i][j] == 'W'
end

def collect_puddles(lake)
  puddles = []
  lake.each_index do |i|
    lake[i].each_index do |j|
      if lake[i][j] == 'W' && !searched?(lake, i, j)
        puddles << search_w(lake, i, j)
      end
    end
  end
  puddles
end

def count_puddle(lake)
  collect_puddles(lake).length
end

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

puts count_puddle(lake)
