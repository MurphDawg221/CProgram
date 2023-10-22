//Southern New Hampshire University
//Brandon Murphy
//CS-210-J7357
//Prof. Parker
//20231015

#include <fstream>          // include f steam because we need to read in and out a text file
#include <iostream>
#include <iomanip>
#include <string>
#include <map>              // we must include map function 
#include "GroceryList.h"    //include h file we are defining out function outside our class

using namespace std;

GroceryItem:: GroceryItem(string input, string output) {   //contructor for reading in inventory text file
	ifstream inputFile(input);
	string name;


	while (inputFile >> name) {                           // loop to set parameters for reading in our text file
		if (name == " ") {
			break;
		}

		this->addItem(name);                             
	}
	inputFile.close();

	ofstream outputFile(output);                       // Writing inventory to output file using maps and pointer functions 
	for (map<string, int>::iterator it = this->Inventory.begin(); it != this->Inventory.end(); it++) {
		outputFile << it->first << " " << it->second << endl;
	}
	outputFile.close();
}

void GroceryItem::addItem(string name) {             
	if (this->Inventory.count(name) > 0) {
		this->Inventory[name]++;            //add to frequency if item is already in inventory
	}
	
	else {
		this->Inventory[name] = 1;
	}
}

void GroceryItem::removeItem(string name) {
	
	if (this->Inventory.count(name) > 0) {
		this->Inventory[name]--;           //subtract from frequency if item is already in inventory
	}
	
	if (this->Inventory[name] == 0) {
		this->Inventory.erase(name);       
	}
}

int GroceryItem::amount(string name) {
	return this->Inventory.count(name);
}

string GroceryItem::getAmounts() {     // iterates through inventory to get frequency of items
	string output = "";
	
	for (map<string, int>::iterator it = this->Inventory.begin(); it != this->Inventory.end(); it++) {
		output += it->first + ": " + to_string(it->second) + "\n";
	}

	return output;
}

std::string GroceryItem::sanitizeString(std::string t_str) {         // sanitize string function just allows user to be able to type items in upper or lower case without it bugging out.
	                                                              
	char firstChar = t_str[0];

	firstChar = toupper(firstChar);

	t_str[0] = firstChar;
	return t_str;
}


void GroceryItem::DisplayAmount(string name) {                // Prints frequency of item            

	name = sanitizeString(name);
	
	if (this->Inventory.count(name) > 0) {
		cout << name << ": " << this->Inventory[name] << endl;

	}
	
	else {                                                // parameter for item not in inventory 
		cout << name << " is not in the inventory." << endl;
	}
}

void GroceryItem::DisplayAmounts() {                    // print frequency for all items in inventory

	for (map<string, int>::iterator it = this->Inventory.begin(); it != this->Inventory.end(); it++) {

		cout << left << setw(20) << it->first << right << it->second << endl;
	}
}

void GroceryItem::printHistogram() {                   // print histogram frequency for all items in inventory
	string asterisks = "";
	
	for (map<string, int>::iterator it = this->Inventory.begin(); it != this->Inventory.end(); it++) {
		
		asterisks = "";                               // adds one to every item as they repeat
		for (int i = 0; i < it->second; i++) {
			asterisks += "*";
		}

		cout << left << setw(20) << it->first << right << asterisks << endl;
	}

}
