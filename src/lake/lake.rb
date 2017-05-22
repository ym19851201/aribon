require 'set'

def search_w(lake, row, col, points=Set.new)
  return if out_of_bounds? lake, row, col
  return if points.include? [row, col]
  return unless lake[row][col] == 'W'

  points.add [row, col] 

  search_w lake, row - 1, col + 1, points
  search_w lake, row, col + 1, points
  search_w lake, row + 1, col, points
  search_w lake, row + 1, col + 1, points

  search_w lake, row + 1, col - 1, points

  points
end

def out_of_bounds?(lake, row, col)
  row < 0 || row > lake.length - 1 || col < 0 || col > lake[row].length - 1
end

def sets_has_item?(sets, item)
  sets.any? {|s| s != nil && s.include?(item)}
end

def collect_puddles(lake)
  puddles = []
  lake.each.with_index do |row, i|
    row.each.with_index do |col, j|
      if !sets_has_item?(puddles, [i, j]) && lake[i][j] == 'W'
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
