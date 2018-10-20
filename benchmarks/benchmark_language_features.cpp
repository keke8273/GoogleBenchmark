#include <benchmark/benchmark.h>
#include <dynamic_casting.h>

// Benchmark dynamic cast
static void BM_dynamic_cast(benchmark::State& state) {
    for (auto _ : state) {
        benchmark_dynamic_cast();
    }
}

BENCHMARK(BM_dynamic_cast);

// benchmark static cast
static void BM_static_cast(benchmark::State& state) {
    for (auto _ : state) {
        benchmark_static_cast();
    }
}

BENCHMARK(BM_static_cast);


