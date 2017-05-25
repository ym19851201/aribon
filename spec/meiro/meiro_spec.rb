require 'spec_helper'
require './src/meiro/meiro'

labyrinth = 
<<EOS
#S######.#
......#..#
.#.##.##.#
.#........
##.##.####
....#....#
.#######.#
....#.....
.####.###.
....#...G#
EOS
labyrinth =  labyrinth.each_line.to_a.map {|s| s.chomp.each_char.to_a}
# labyrinth = 
# <<EOS
# #S##..##.#
# ........G#
# EOS
# labyrinth =  labyrinth.each_line.to_a.map {|s| s.chomp.each_char.to_a}

labyrinth2 = 
<<EOS
#S######.#
......#..#
.#.##.##.#
.#........
##.##.####
....#....#
.#######.#
....##...#
.####.##..
........G#
EOS
labyrinth2 =  labyrinth2.each_line.to_a.map {|s| s.chomp.each_char.to_a}

# labyrinth2 = 
# <<EOS
# #S######.#
# #.....#..#
# .####.##.#
# .#......#.
# ........G.
# EOS
# labyrinth2 =  labyrinth2.each_line.to_a.map {|s| s.chomp.each_char.to_a}

# labyrinth2 = 
# <<EOS
# #S######.#
# #.....#..#
# #####...G.
# EOS
# labyrinth2 =  labyrinth2.each_line.to_a.map {|s| s.chomp.each_char.to_a}

describe 'solve' do
  context 'when labyrinth has a single route to arrive at goal' do
    let(:args) {labyrinth}
    it 'calculates turns to solve labyrinth' do
      expect(solve(args)).to eq 22
    end
  end
  context 'when labyrinth has some routes to arrive at goal' do
    let(:args) {labyrinth2}
    it 'calculates turns to solve labyrinth' do
      expect(solve(args)).to eq 16
    end
  end
end

describe 'find_start' do
  it 'derives position of S in labyrinth' do
    expect(find_start(labyrinth)).to eq [0, 1]
  end
end

