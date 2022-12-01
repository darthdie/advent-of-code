calories_per_elf = File.open("puzzle_input_1.txt") do |f|
    f.readlines(chomp: true)
        .slice_when { |i, line| line.empty? }
        .map { |groups| groups.map(&:to_i).sum }
end

most_calories = calories_per_elf.max
top_three = calories_per_elf.sort.reverse.take(3).sum