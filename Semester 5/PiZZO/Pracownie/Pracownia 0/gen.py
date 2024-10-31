import random
import json

# useful function when all parameters are random generated
def create_automaton(alphabet, states, initial, accepting, transitions):
	automaton = {
		"alphabet": alphabet,
		"states": states,
		"initial": initial,
		"accepting": accepting,
		"transitions": transitions
	}

	return automaton


def save_automaton_to_json(filename, automaton):
	with open(filename, 'w') as json_file:
		json.dump(automaton, json_file, indent=4)


def save_input(input_filename, automaton_filename, input):
	with open(input_filename, 'w') as input_file:
		input_file.write(automaton_filename)
		input_file.write('\n')
		input_file.write(input)


def gen_input(alphabet):
	MAX_T = 10**2
	MAX_N = 10**3

	input = ''

	for i in range(MAX_T):
		s_length = random.randrange(1, MAX_N)

		s = ''.join(random.choice(alphabet) for _ in range(s_length))

		input += s
		input += '\n'

	return input


if __name__ == "__main__":
	random.seed(42)

	automatons = [{
		"alphabet" : ["a", "b"],
		"states" : ["q1", "q2"],
		"initial" : "q1",
		"accepting" : ["q2"],
		"transitions" : [
			{"letter": "a", "from": "q1", "to": "q1"},
			{"letter": "b", "from": "q1", "to": "q2"},
			{"letter": "a", "from": "q2", "to": "q1"},
			{"letter": "b", "from": "q2", "to": "q2"}
		]},
		{
		"alphabet" : ["a", "b", "c"],
		"states" : ["q1", "q2", "q3"],
		"initial" : "q1",
		"accepting" : ["q3"],
		"transitions" : [
			{"letter": "a", "from": "q1", "to": "q1"},
			{"letter": "b", "from": "q1", "to": "q2"},
			{"letter": "c", "from": "q1", "to": "q3"},
			{"letter": "a", "from": "q2", "to": "q1"},
			{"letter": "b", "from": "q2", "to": "q2"},
			{"letter": "c", "from": "q2", "to": "q3"},
			{"letter": "a", "from": "q3", "to": "q3"},
			{"letter": "b", "from": "q3", "to": "q3"},
			{"letter": "c", "from": "q3", "to": "q3"}
		]},
		{
		"alphabet" : ["a", "b"],
		"states" : ["q1", "q2"],
		"initial" : "q1",
		"accepting" : ["q1"],
		"transitions" : [
			{"letter": "a", "from": "q1", "to": "q1"},
			{"letter": "b", "from": "q1", "to": "q2"},
			{"letter": "a", "from": "q2", "to": "q1"},
			{"letter": "b", "from": "q2", "to": "q2"}
		]}]


	for i in range(len(automatons)):
		save_automaton_to_json(f'automaton{i}.json', automatons[i])
		input = gen_input(automatons[i]['alphabet'])
		# print(input)
		save_input(f'in{i}', f'automaton{i}.json', input)

	print("Input files created successfully.")
