const anotherFile = @import("./anotherMod/anotherFile.zig");

pub var countPtr = &anotherFile.counter;

pub fn helloWorld() []const u8 {
    return "Hello world!";
}
