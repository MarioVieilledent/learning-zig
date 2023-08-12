// Pointers

const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const x: isize = 1234;
    {
        const x_ptr: *const isize = &x;
        print("type of x_ptr = {}\n", .{@TypeOf(x_ptr)});
        add766(x_ptr);
    }
    print("{}\n", .{x});

    var array = [_]u8{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
    const single_ptr = &array[4];
    print("array[4] = {}\n", .{single_ptr.*});
    print("array[4] = {}\n", .{array[4]});
    single_ptr.* += 1;
    print("array[4] = {}\n", .{single_ptr.*});
    print("array[4] = {}\n", .{array[4]});

    var arr = [_]i32{ 1, 2, 3, 4 };
    var ptr: [*]const i32 = &arr;
    print("{}\n", .{ptr[0]});
    ptr += 1;
    print("{}\n", .{ptr[0]});

    var arr2 = [_]i32{ 1, 2, 3, 4 };
    var length: usize = 0;
    var slice = arr2[length..arr2.len];

    print("slice[0] = {}, slice[3] = {}, len = {}\n", .{ slice[0], slice[3], slice.len });

    slice.ptr += 1;
    print("slice[0] = {}, slice[3] = {}, len = {}\n", .{ slice[0], slice[3], slice.len });

    print("--------------\n", .{});

    print("{}\n", .{arr[1]});
    const arr_ptr = arr[0..arr.len];
    arr_ptr[1] += 10;
    print("{}\n", .{arr[1]});

    const val: i1024 = 2;
    const val_ptr = &val;
    const ptr_into_int = @intFromPtr(val_ptr);
    print("{}, of type {}\n", .{ ptr_into_int, @TypeOf(ptr_into_int) });

    print("--------------\n", .{});

    const zeroVal: *u8 = @ptrFromInt(10);
    print("ptr 0 => {}\n", .{zeroVal}); // ????
}

// Comptime pointer works

test "comptime pointer" {
    var x: i256 = 6_000_000;
    const x_ptr: *i256 = &x;
    x_ptr.* -= 1;
    x += 2;
    try std.testing.expect(x_ptr.* == 6_000_001); // Works
}

fn add766(val: *const isize) void {
    print("{}\n", .{val});
    // val.* += 766;
}

// isize@9642fff918
