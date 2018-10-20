#include <benchmark/benchmark.h>
#include <sstream>

// Benchmark string creation
static void BM_string_creation(benchmark::State& state) {
    for (auto _ : state) {
        std::string empty_string;
    }
}

BENCHMARK(BM_string_creation);

// Benchmark string copy
static void BM_stringstream_creation(benchmark::State& state) {
    for (auto _ : state) {
        std::stringstream ss;
    }
}

BENCHMARK(BM_stringstream_creation);

