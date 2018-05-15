#include "example/dice.hpp"

#include <boost/random.hpp>

namespace example
{

int roll_dice()
{
	static boost::random::mt19937 rng;
	static boost::random::uniform_int_distribution<> dice(1, 6);
	return dice(rng);
}

} // end namespace example
