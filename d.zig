const std = @import("std");
const print = std.debug.print;

test "expect this to fail" {
    try std.testing.expect(1 == 5 - 4);
}

test "expect this to succeed" {
    try std.testing.expect(true);
}

test "skipped test" {
    return error.SkipZigTest;
}

test "detect leak" {
    var list = std.ArrayList(u21).init(std.testing.allocator);
    defer list.deinit();
    try list.append('☔');

    try std.testing.expect(list.items.len == 1);
}

pub fn main() void {}
