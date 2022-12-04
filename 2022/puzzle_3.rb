def upcase?(str)
  str == str.upcase
end

def find_shared_element(arrays)
  arrays.to_a.reduce(:&).first
end

def priority_for(chr)
  chr.ord - (upcase?(chr) ? 38 : 96)
end

file_lines = File.open("puzzle_inputs/3.txt") { |f| f.readlines(chomp: true) }

priorities = file_lines.map do |line|
  shared_element = find_shared_element(line.chars.each_slice(line.length / 2))

  priority_for(shared_element)
end

part_1_solution = priorities.sum

priorities = file_lines.each_slice(3).map do |lines|
  shared_element = find_shared_element(lines.map(&:chars))

  priority_for(shared_element)
end

part_2_solution = priorities.sum

print(part_1_solution)
print("\r\n")
print(part_2_solution)