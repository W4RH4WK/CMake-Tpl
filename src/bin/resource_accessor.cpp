#include <fstream>
#include <iostream>

#include "example/resource_path.hpp"

int main()
{
	std::fstream in(example::resource_path() + "/dummy.txt");
	if (in) {
		std::cout << in.rdbuf();
	} else {
		std::cout << "Error opening dummy resource\n";
	}
}
