def check_memory_usage(data):
	memory_usage = []

	start_memory_usage = 0

	memory_units = {
		"B" : 1,
		"KiB" : 2**10,
		"MiB" : 2**20,
		"GiB" : 2**30,
		"KB" : 10**3,
		"MB" : 10**6,
		"GB" : 10**9
	}

	# Process each line of the input data
	for line in data:
		parts = line.split()
		print(parts)

		if len(parts) == 0:
			continue

		if parts[-1] == "@profile":
			start_memory_usage = float(parts[1]) * memory_units[parts[2]]
		else:
			try:
				memory = float(parts[1]) * memory_units[parts[2]]

				memory_usage.append(memory)
			except:
				# skip line (no memory informations)
				continue

	if not memory_usage:
		print("No valid memory_usage found.")
		return

	max_memory_usage = max(memory_usage)
	memory_used_by_function = max_memory_usage - start_memory_usage
	memory_usage_factor = 2

	print(f"Max memory usage: {max_memory_usage:.3f} B")
	print(f"Max memory usage: {max_memory_usage // 10**6} MB")

	is_same_order = (memory_used_by_function == 0)

	if not is_same_order:
		print("NO")


if __name__ == "__main__":
	filename = input()

	with open(filename, "r") as file:
		data = [line for line in file]

	check_memory_usage(data)
