const std = @import("std");
const print = std.debug.print;
const assert = std.debug.assert;
const mem = std.mem;

pub fn main() void {
    // Array literal
    const list = [_]u8{'h', 'e', 'l', 'l', 'o'};
    comptime assert(list.len == 5); // Fails so can't compile
    print("List len = {} and content = {?s}\n", .{list.len, list});

    // String literal = single-item pointer to an array
    const message = "hello";
    comptime assert(mem.eql(u8, &list, message));

    comptime {
        var sum: usize = 0;
        for (list) |byte| {
            sum += byte;
        }
        const nb: usize = 'h' + 'e' + 'l' * 2 + 'o';
        assert(sum == nb);
    }

    // Modifying an array
    var some_integers: [100]i32 = undefined;
    for (&some_integers, 0..) |*item, i| {
        item.* = @intCast(i);
    }
    print("{}\n", .{some_integers[10] == 10});
    print("{}\n", .{some_integers[99] == 99});
    for (&some_integers, 0..) |item, i| {
        if (i % 10 == 0) print("some_integers[{}] = {}\n", .{i, item});
    }
}