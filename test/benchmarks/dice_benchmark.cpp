#include <benchmark/benchmark.h>

#include "example/dice.hpp"

static void BM_Dice(benchmark::State &state)
{
	while (state.KeepRunning()) {
		for (int i = 0; i < state.range(0); i++) {
			example::roll_dice();
		}
	}
}
BENCHMARK(BM_Dice)->Range(8, 8 << 10);

BENCHMARK_MAIN();
