const std = @import("std");
const print = std.debug.print;
const mod = @import("./module.zig");

pub fn main() void {
    const msg = mod.helloWorld();
    var counterptr = mod.countPtr;
    print("{?s}\n", .{msg});
    print("{}\n", .{counterptr.*});
    counterptr.* = 420;
    print("{}\n", .{counterptr.*});
    print("{}\n", .{mod.countPtr.*});
}
