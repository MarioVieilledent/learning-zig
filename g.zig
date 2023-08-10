const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;

test "test integers" {
    var x: isize = 0;
    for (0..10) |_| {
        x +|= 1;
        print("x = {}\n", .{x});
    }
}

fn divide(a: i32, b: i32) i32 {
    return a / b;
}

test "c quoi le type ???" {
    const inf = std.math.inf(f32);
    const negative_inf = -std.math.inf(f64);
    const nan = std.math.nan(f128);

    print("type de inf = {} valeur = {}\n", .{ @TypeOf(inf), inf });
    print("type de negative_inf = {} valeur = {}\n", .{ @TypeOf(negative_inf), negative_inf });
    print("type de nan = {} valeur = {}\n", .{ @TypeOf(nan), nan });
}
