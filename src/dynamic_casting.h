#pragma once

class Calculator{
    public:
        virtual int calculate(int x, int y) = 0;
};

class Add : public Calculator {
    public:
        virtual int calculate(int x, int y) override { return x+y;}
};

class Substract : public Calculator {
    public:
        virtual int calculate(int x, int y) override { return x-y;}
};

static void benchmark_dynamic_cast() {
    Add adder;
    Calculator* p_calculator = &adder;
    dynamic_cast<Add*>(p_calculator)->calculate(1, 2);
}

static void benchmark_static_cast() {
    Add adder;
    Calculator* p_calculator = &adder;
    static_cast<Add*>(p_calculator)->calculate(1, 2);
}
