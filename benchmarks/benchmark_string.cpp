#include <benchmark/benchmark.h>

// Benchmark string copy
static void BM_string_copy(benchmark::State& state) {
    std::string x = "hello";
    for (auto _ : state)
        std::string copy(x);
}

BENCHMARK(BM_string_copy);

