// Blocks
const std = @import("std");
const expect = std.testing.expect;

test "block" {
    var ptr: *i32 = undefined;
    var a: i32 = b: {
        var val: i32 = 46;
        ptr = &val;
        break :b val;
    };
    try expect(a == 46);
    try expect(ptr.* == a);
}
