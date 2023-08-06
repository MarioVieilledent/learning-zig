const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const a: i32 = 42;
    const b: f64 = 5.5;
    // Debug print
    std.debug.print("Test {} {}\n", .{a, b});

    const c: f64 = a + b;
    print("{}\n", .{c});

    // Optional
    var elem: ?i32 = null;
    print("Optional: {?}\n", .{elem orelse 12});

    elem = 777;
    print("Optional: {?}\n", .{elem orelse 12});
}