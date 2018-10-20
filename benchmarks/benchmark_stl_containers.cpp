#include <benchmark/benchmark.h>
#include <sstream>

// Benchmark string construction
static void BM_string_construction(benchmark::State& state) {
    for (auto _ : state) {
        std::string empty_string;
    }
}

BENCHMARK(BM_string_construction);

// benchmark stringstream construction
static void BM_stringstream_construction(benchmark::State& state) {
    for (auto _ : state) {
        std::stringstream ss;
    }
}

BENCHMARK(BM_stringstream_construction);


