// Verctors

const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const a = @Vector(4, f64){ 1.5, 6.4, 1.7, 5.2 };
    const b = @Vector(4, f64){ -1.5, 8.4, -11.7, 5.42 };
    const c = a + b;
    print("c[0] = {}\n", .{c[0]});

    const arrC: [4]f64 = c;
    for (arrC, 0..) |val, index| {
        print("c[{}] = {}\n", .{ index, val });
    }
}
