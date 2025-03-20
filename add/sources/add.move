module add::addition_module {
    use std::debug;

    public fun add_and_trace(a: u64, b: u64): u64 {
        let result = a + b;

        // Print the stack trace for debugging
        debug::print_stack_trace();

        return result
    }

    public fun subtract_and_trace(a: u64, b: u64): u64 {
        let result = a - b;

        // Print the stack trace for debugging
        debug::print_stack_trace();

        return result
    }

    public fun multiply_and_trace(a: u64, b: u64): u64 {
        let result = a * b;

        // Print the stack trace for debugging
        debug::print_stack_trace();

        return result
    }

    public fun divide_and_trace(a: u64, b: u64): u64 {
        let result = a / b;

        // Print the stack trace for debugging
        debug::print_stack_trace();

        return result
    }

    // Test function
    #[test]
    public fun test_add_and_trace() {
        let result1 = add_and_trace(400, 876);
        let result2 = subtract_and_trace(9, 4);
        let result3 = multiply_and_trace(808, 4675);
        let result4 = divide_and_trace(80, 3);

        // Print the result
        debug::print(&result1);
        debug::print(&result2);
        debug::print(&result3);
        debug::print(&result4);

        // You can add more test cases if needed
    }
}
