#include <unordered_set>
#include <unordered_map>
#include <iostream>
#include <fstream>
#include <vector>

using namespace std;

struct State {
	int state;

	State() : state(0) {}
	State(const int& state) : state(state) {}
	
	friend istream& operator>>(istream& inputStream, State& state) {
		inputStream >> state.state;
		return inputStream;
	}
};

struct Transition {
	int x, y;
	char letter;

	friend istream& operator>>(istream& inputStream, Transition& transition) {
		inputStream >> transition.x >> transition.y >> transition.letter;
		return inputStream;
	}
};

class FiniteAutomata {
private:
	unsigned int nrOfStates; // N
	unordered_set<State> states;
	unsigned int nrOfTransitions; // M
	unsigned int initialState; // S
	unsigned int nrOfFinalStates; // nrF
	unordered_set<State> finalStates;

public:
	// FiniteAutomata() {}
	 
	friend istream& operator>>(istream& inputStream, FiniteAutomata& finiteAutomata) {
		inputStream >> finiteAutomata.nrOfStates;
		for (int i = 0; i < finiteAutomata.nrOfStates; ++i) {
			State state;
			inputStream >> state;
			finiteAutomata.states.insert(state);
		}

		inputStream >> finiteAutomata.nrOfTransitions;
		for (int i = 0; i < finiteAutomata.nrOfTransitions; ++i) {
			Transition transition;
			inputStream >> transition;
			// TODO 
		}

		inputStream >> finiteAutomata.initialState;
		inputStream >> finiteAutomata.nrOfFinalStates;

		for (int i = 0; i < finiteAutomata.nrOfFinalStates; ++i) {
			State state;
			inputStream >> state;
			finiteAutomata.finalStates.insert(state);
		}

		return inputStream;
	}
};

int main() {
	cout << "hell\n";
	return 0;
}
