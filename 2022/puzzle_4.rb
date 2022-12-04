file_lines = File.open("puzzle_inputs/4.txt") { |f| f.readlines(chomp: true) }

ranges = file_lines.map do |line|
  range_1, range_2 = line.split(',')
    .map { |r| r.split('-') }
    .map { |x, y| x.to_i..y.to_i }
end

part_1_solution = ranges
  .filter { |range_1, range_2| range_1.cover?(range_2) || range_2.cover?(range_1) }
  .length

def ranges_overlap?(range_a, range_b)
  range_b.begin <= range_a.end && range_a.begin <= range_b.end 
end 

part_2_solution = ranges
  .filter { |range_1, range_2| ranges_overlap?(range_1, range_2) || ranges_overlap?(range_2, range_1) }
  .length