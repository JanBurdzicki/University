import json
import sys

class State:
	def __init__(self, name, is_accepting):
		self.name = name
		self.is_accepting = is_accepting
		self.transitions = {}

	def add_transition(self, letter, next_state):
		self.transitions[letter] = next_state

	def update(self, letter):
		try:
			return self.transitions[letter]
		except:
			print("Invalid letter!")
			exit()

	# debug function
	def __str__(self):
		s = f"is_accepting?: {self.is_accepting}\ntransitions:\n"
		for letter in self.transitions:
			s += f"\t{letter}: {self.transitions[letter].name}\n"
		return s


class Automaton:
	def __init__(self, filename):
		self.states = {}
		with open(filename, "r") as file:
			data = json.load(file)
			self.load_states(data["states"], data["accepting"])
			self.set_transitions(data["transitions"])
			self.initial_state = self.states[data["initial"]]

	def load_states(self, states, accepting_states):
		for state in states:
			self.states[state] = State(state, state in accepting_states)

	def set_transitions(self, transitions):
		for transition in transitions:
			previous_state = transition["from"]
			next_state = self.states[transition["to"]]
			letter = transition["letter"]
			self.states[previous_state].add_transition(letter, next_state)

	# debug function
	def __str__(self):
		s = "\n".join(f"name: {name}\n{self.states[name]}" for name in self.states)
		return s


# for memory analysis -> python3 -m memory_profiler pizzo0.py
# @profile
def main():
	filename = sys.stdin.readline()[:-1]

	try:
		automaton = Automaton(filename)
	except:
		print("Invalid automaton description!")
		exit()

	state = automaton.initial_state

	# print(automaton)

	while char := sys.stdin.read(1):
		if char == "\n":
			if state.is_accepting:
				print("yes")
			else:
				print("no")

			state = automaton.initial_state
		else:
			state = state.update(char)


if __name__ == "__main__":
	main()
