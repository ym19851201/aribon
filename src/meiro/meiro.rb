def solve(labyrinth)
  path = [find_start(labyrinth)]
  paths = []
  hash = {}
  while path && !path.empty?
    pos = path.last
    paths << path.clone if goal?(labyrinth, pos)
    hash[pos] = movable_positions(labyrinth, pos, path) if hash[pos].nil?
    next_pos = hash[pos].shift
    if next_pos.nil?
      path.pop
    else
      path << next_pos
    end
  end
  paths.map { |e| e.length - 1 }.min
end

def movable_positions(labyrinth, pos, path)
  return [] if pos.nil? || goal?(labyrinth, pos)
  row = pos[0]
  col = pos[1]
  khlj = [[row - 1, col], [row, col - 1], [row, col + 1], [row + 1, col]]
  khlj.select { |e| movable?(labyrinth, e, path) }
end

def movable?(labyrinth, position, path)
  return false if path.include?(position)
  return false if out_of_bounds?(labyrinth, position)
  labyrinth[position[0]][position[1]] == '.' || goal?(labyrinth, position)
end

def out_of_bounds?(labyrinth, position)
  row = position[0]
  col = position[1]
  return true if row < 0 || col < 0
  labyrinth.length - 1 < row || labyrinth[row].length - 1 < col
end

def find_start(labyrinth)
  labyrinth.each_with_index do |row, r|
    c = row.index('S')
    return [r, c] if row.index('S') > 0
  end
end

def goal?(labyrinth, position)
  return false if position.nil?
  labyrinth[position[0]][position[1]] == 'G'
end
