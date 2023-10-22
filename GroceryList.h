//Southern New Hampshire University
//Brandon Murphy
//CS-210-J7357
//Prof. Parker
//20231015

#ifndef GroceryItem_H
#define GroceryItem_H

#include <string>
#include <map>

using namespace std;

class GroceryItem {

public:
	
	GroceryItem(string input, string output);     // function given in PDF

	std::string sanitizeString(std::string t_str);   // added this to clear bug so user can type upper or lower case

	int amount(string name);                      // This will return the frequency of all items

	void addItem(string name);                    // function given in PDF

	void removeItem(string name);                 // function given in PDF

	string getAmounts();                          // This will return the frequency of a specified item

	void DisplayAmount(string name);                // display frequency of selected item

	void DisplayAmounts();                          // display frequency of all items

	void printHistogram();                          // display frequency of all items as a histogram

private:

	map<string, int> Inventory;    // use of maps function was recommended in directions set as private because I use it to pull items from a input file

};

#endif
