const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;

const Student = struct {
    nom: []const u8,
    age: u8,
};

pub fn main() void {
    const guez = Student{
        .nom = "Guezzard",
        .age = 20,
    };

    print("Nom = {?s}\n", .{guez.nom});

    print("Max d'un i64 = {}\n", .{std.math.maxInt(i64)});

    std.debug.assert(@as(u32, std.math.maxInt(u32)) +| 1 == @as(u32, std.math.maxInt(u32)));

    std.debug.assert(-%@as(i8, std.math.minInt(i8)) == std.math.minInt(i8));

    const value: anyerror!u32 = error.Broken;
    const unwrapped: u32 = value catch 1234;
    std.debug.assert(unwrapped == 1234);
}
