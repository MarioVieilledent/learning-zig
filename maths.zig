const print = @import("std").debug.print;

pub fn main() void {
    for (0..100) |x| {
        const fx: f64 = @floatFromInt(x);
        const max: f64 = 30.0 + 25.0 * @cos(fx / 5.0);
        const nb: usize = @intFromFloat(max);
        for (0..nb) |_| {
            print("x", .{});
        }
        print("\n", .{});
    }
}
