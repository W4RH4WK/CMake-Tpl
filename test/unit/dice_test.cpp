#include <gtest/gtest.h>

#include "example/dice.hpp"

TEST(Dice, Single)
{
	auto result = example::roll_dice();
	ASSERT_TRUE(1 <= result && result <= 6);
}
