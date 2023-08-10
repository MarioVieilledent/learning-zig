const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello, {s}!\n", .{"world"});

    var a: ?[]const u8 = null;
    try stdout.print("Type: {}, value: {?s}, size: {}, isNull = {}\n", .{ @TypeOf(a), a, (a orelse "").len, a == null });
    a = "Hello!";
    try stdout.print("Type: {}, value: {?s}, size: {}, isNull = {}\n", .{ @TypeOf(a), a, (a orelse "").len, a == null });
    a = "He";
    try stdout.print("Type: {}, value: {?s}, size: {}, isNull = {}\n", .{ @TypeOf(a), a, (a orelse "").len, a == null });

    var b: anyerror![]const u8 = error.ArgNotFound;
    try stdout.print("Type = {}, value = {!s}, isError = {}\n", .{ @TypeOf(b), b, b == error.ArgNotFound });
    b = "Hello world";
    try stdout.print("Type = {}, value = {!s}, isError = {}\n", .{ @TypeOf(b), b, b == error.ArgNotFound });

    try stdout.print("Type of i64 = {}\n", .{@TypeOf(i4)});
    try stdout.print("Size of i8 = {}\n", .{@sizeOf(i8)});
    try stdout.print("Size of i16 = {}\n", .{@sizeOf(i16)});
    try stdout.print("Size of i32 = {}\n", .{@sizeOf(i32)});
    try stdout.print("Size of i64 = {}\n", .{@sizeOf(i64)});
    try stdout.print("Size of i80 = {}\n", .{@sizeOf(i80)});
    try stdout.print("Size of i128 = {}\n", .{@sizeOf(i128)});
    try stdout.print("Size of i12345 = {}\n", .{@sizeOf(i12345)});
    try stdout.print("Size of pointer on i8 = {}\n", .{@sizeOf(*i8)});
    try stdout.print("Size of pointer on i128 = {}\n", .{@sizeOf(*i8)});
}
