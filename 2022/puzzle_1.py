import itertools

with open("puzzle_input_1.txt") as f:
    lines = f.read().splitlines()

    groups = [list(g) for k, g in itertools.groupby(lines, lambda l: len(l))]
    filtered = filter(lambda grp: len(grp[0]), groups)
    calories_per_elf = list(map(lambda grp: sum(map(int, grp)), filtered))

    most_calories = max(calories_per_elf)
    top_three_summed = sum(sorted(calories_per_elf, reverse=True)[0:3])