// Arrays

const std = @import("std");
const print = std.debug.print;
const assert = std.testing.assert;

pub fn main() void {
    print("Test\n", .{});

    // Level 1, array of isize
    var arr1: [4]isize = undefined;
    for (&arr1, 0..) |*item, index| {
        item.* = @intCast(42 * index);
    }

    for (arr1, 0..) |item, index| {
        print("arr1[{}] = {}\n", .{ index, item });
    }

    // Level 2, array of strings
    var arr2: [5][]const u8 = undefined;

    fillArrayWith(&arr2, "Test");
    fillArrayWith(&arr2, "Salut les amis!");
    fillArrayWith(&arr2, "Guezzrd");

    // Level 3: array of u8
    var arr3: [256]u8 = undefined;

    for (&arr3, 0..) |*item, i| {
        item.* = @intCast(i);
    }

    for (arr3) |u8toDiplay| {
        print("{?d} / {?c}, ", .{ u8toDiplay, u8toDiplay });
    }
}

fn fillArrayWith(arr: *[5][]const u8, pattern: []const u8) void {
    for (arr) |*item| {
        item.* = pattern;
    }

    for (arr.*, 0..) |item, index| {
        print("arr2[{}] = {?s}\n", .{ index, item });
    }
}
