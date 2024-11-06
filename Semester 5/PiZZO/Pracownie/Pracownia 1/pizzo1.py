import json
import sys

class Automaton:
	def __init__(self, alphabet, max_states, samples):
		self.alphabet = alphabet
		self.max_states = max_states
		self.states = []
		self.state_counter = 0
		self.initial_state = self.create_state()
		self.transitions = {}
		self.accepting_states = []

		self.create_automaton(samples)

	def create_automaton(self, samples):
		for sign, word in samples:
			is_accepting = (sign == '+')
			self.add_word(word, is_accepting)

	def create_state(self):
		state_name = f"q{self.state_counter}"
		self.states.append(state_name)
		self.state_counter += 1
		return state_name

	def add_transition(self, current_state, letter, next_state):
		self.transitions[(current_state, letter)] = next_state

	def add_word(self, word, is_accepting):
		current_state = self.initial_state

		for letter in word:
			if (current_state, letter) not in self.transitions:
				next_state = self.create_state()
				self.add_transition(current_state, letter, next_state)
				current_state = next_state
			else:
				current_state = self.transitions[(current_state, letter)]

		if is_accepting:
			self.accepting_states.append(current_state)

	def determine_automaton(self, is_debug=False):
		chosen_state = self.initial_state
		is_deterministic = True

		for state in self.states:
			for letter in self.alphabet:
				if (state, letter) not in self.transitions:
					is_deterministic = False
					if not is_debug:
						chosen_state = state
						self.add_transition(state, letter, chosen_state)

		assert(len(self.transitions) == len(self.states) * len(self.alphabet))
		return is_deterministic

	def update_automaton(self, alphabet, max_states, states, state_counter, initial_state, transitions, accepting_states):
		self.alphabet = alphabet
		self.max_states = max_states
		self.states = states
		self.state_counter = state_counter
		self.initial_state = initial_state
		self.transitions = transitions
		self.accepting_states = accepting_states

	def hopcroft_minimize(self):
		# Step 1: Initialize partitions
		partition = {frozenset(self.accepting_states), frozenset(set(self.states) - set(self.accepting_states))}
		worklist = [frozenset(self.accepting_states)] if self.accepting_states else []

		# Step 2: Process partition classes
		while worklist:
			A = worklist.pop()
			for letter in self.alphabet:
				# Step 3: Find states that transition on 'letter' into a state in 'A'
				X = frozenset(state for state in self.states if self.transitions.get((state, letter)) in A)

				new_partition = set()
				for Y in partition:
					# Split Y into parts that transition to X and those that don't
					intersection = Y & X
					difference = Y - X
					if intersection and difference:
						new_partition.add(intersection)
						new_partition.add(difference)
						# Update worklist with the smaller subset
						if Y in worklist:
							worklist.remove(Y)
							worklist.append(intersection)
							worklist.append(difference)
						else:
							worklist.append(intersection if len(intersection) <= len(difference) else difference)
					else:
						new_partition.add(Y)
				partition = new_partition

		# Step 4: Build the minimized DFA
		# Map each partition to a single state in the minimized DFA
		minimized_states = {state: idx for idx, part in enumerate(partition) for state in part}
		minimized_transitions = {}
		minimized_accepting_states = set()
		minimized_initial_state = minimized_states[self.initial_state]

		for (state, symbol), next_state in self.transitions.items():
			if state in minimized_states and next_state in minimized_states:
				minimized_transitions[(minimized_states[state], symbol)] = minimized_states[next_state]

		for state in self.accepting_states:
			if state in minimized_states:
				minimized_accepting_states.add(minimized_states[state])

		reversed_states = {v: k for k, v in minimized_states.items()}

		minimized_states = list(reversed_states.values())

		minimized_transitions = {
			(reversed_states[state_num], letter): reversed_states[next_state]
			for (state_num, letter), next_state in minimized_transitions.items()
		}

		minimized_accepting_states = [reversed_states[state_num] for state_num in minimized_accepting_states]

		self.update_automaton(self.alphabet, self.max_states, minimized_states, len(minimized_states), reversed_states[minimized_initial_state], minimized_transitions, minimized_accepting_states)

	def to_dict(self):
		return {
			"alphabet": self.alphabet,
			"states": self.states,
			"initial": self.initial_state,
			"accepting": self.accepting_states,
			"transitions": [
				{"letter": letter, "from": current_state, "to": next_state}
				for (current_state, letter), next_state in self.transitions.items()
			]
		}

	def to_json(self):
		return json.dumps(self.to_dict(), indent=4)

	def check_word_correctness(self, word, is_accepting):
		current_state = self.initial_state

		for letter in word:
			if (current_state, letter) not in self.transitions:
				print(f"Transition from {current_state} with letter {letter} for {word} doesn't exist!")
				break
			else:
				current_state = self.transitions[(current_state, letter)]

		if is_accepting != (current_state in self.accepting_states):
			print(f"{word} should {'' if is_accepting else 'not '}be accepted!")

	def check_determinism(self):
		return self.determine_automaton(is_debug=True)

	def check_correctness(self, samples):
		for sign, word in samples:
			is_accepting = (sign == '+')
			self.check_word_correctness(word, is_accepting)

		if not self.check_determinism():
			print("Automaton is not deterministic!")

	# debug function
	def __str__(self):
		transitions_str = "\n".join([
			f"\t{state_from} --({letter})--> {state_to}"
			for (state_from, letter), state_to in self.transitions.items()
		])

		return (
			f"Automaton:\n"
			f"Alphabet: {self.alphabet}\n"
			f"Max States: {self.max_states}\n"
			f"States: {self.states}\n"
			f"State Counter: {self.state_counter}\n"
			f"Initial State: {self.initial_state}\n"
			f"Transitions:\n{transitions_str}\n"
			f"Accepting States: {self.accepting_states}"
		)


def main():
	# n <= 100000, max_states <= 100
	input_data = sys.stdin.read().strip().splitlines()
	n, max_states = map(int, input_data[0].split())
	samples = [(line[0], line[1:]) for line in input_data[1:]]

	alphabet = ["a", "b", "c"]
	automaton = Automaton(alphabet, max_states, samples)
	# print(automaton)

	automaton.determine_automaton()
	# print(automaton)

	# minimize the DFA using Hopcroft's algorithm
	automaton.hopcroft_minimize()
	# print(automaton)

	automaton.check_correctness(samples)

	print(automaton.to_json())


if __name__ == "__main__":
	main()
