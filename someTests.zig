const print = @import("std").debug.print;

pub fn main() void {
    print("Size of u7 = {}\n", .{@sizeOf(u7)});
    print("Size of u8 = {}\n", .{@sizeOf(u8)});
    print("Size of i32 = {}\n", .{@sizeOf(i32)});
    print("Size of [4]u8 = {}\n", .{@sizeOf([4]u8)});
    print("Size of *u8 = {}\n", .{@sizeOf(*u8)});
    print("Size of bool = {}\n", .{@sizeOf(bool)});
    print("Size of usize = {}\n", .{@sizeOf(usize)});
    print("Size of isize = {}\n", .{@sizeOf(isize)});
}