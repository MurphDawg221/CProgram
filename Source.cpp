//Southern New Hampshire University
//Brandon Murphy
//CS-210-J7357
//Prof. Parker
//20231015

#include <iostream>
#include "GroceryList.h"          // include h file to be able to use functions that have been defined necessary to run program

using namespace std;

int PrintMenu() {                           // menu display for user 
	int choice = 0;
	std::cout << "Corner Grocer" << std::endl << std::string(25, '*') << std::endl;
	cout << "1. Search for an item" << endl;
	cout << "2. Display a list of all frequencies" << endl;
	cout << "3. Print histogram" << endl;
	cout << "4. Exit Application" << endl;
	cout << "select choice: ";

	while (!(cin >> choice) || choice < 1 || choice > 4) {     // loop for user input values
		cin.clear();
		cin.ignore(1000, '\n');               // same methods used in chapter 8 lab clears errors that remain and characters from input buffer
		cout << "Make another selection: "; 
	}

	return (choice);
}

int main() {
	
	GroceryItem inventory("Inventory.txt", "frequency.dat");       // Allows me to take from the input file and write frequencies to the backup file
	int c = 0;
	string name;

	c = PrintMenu();

	while (c != 4) {                                           // main loop to run program through branching loops based off user input parameter set to exit if user enters 4
		
		if (c == 1) {                                        // parameter set if user input is 1 call DisplayAmount function to process user input through set for loop.
			cout << "Enter the name of the item: ";
			cin >> name;
			inventory.DisplayAmount(name);
		}
		
		else if (c == 2) {                                  // parameter set if user input is 2 call DisplayAmounts function to process user input through set for loop.
			inventory.DisplayAmounts();
		}
		
		else if (c == 3) {
			inventory.printHistogram();                    // parameter set if user input is 3 call printHistogram function to process user input through set for loop.
		}

		cout << endl << endl;                             // display menu again so user can enter another option or close program
		c = PrintMenu();
	}

	return 0;
}
