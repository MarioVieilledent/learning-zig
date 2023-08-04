const std = @import("std");
const os = std.os;
const mem = std.mem;
const debug = std.debug;
const print = debug.print;
const assert = debug.assert;
const expect = std.testing.expect;

pub fn main() void {
    // Integers
    const one_plus_one: i32 = 1 + 1;
    print("1 + 1 = {}\n", .{one_plus_one});

    // Floats
    const seven_div_three: f32 = 7.0 / 3.0;
    print("7.0 / 3.0 = {}\n", .{seven_div_three});

    // Boolean
    print("{} - {} - {}\n", .{
        true and false,
        true or false,
        !true,
    });

    // Optional
    var optional_value: ?[]const u8 = null;
    assert(optional_value == null);

    print("\nOptional 1\ntype: {}\nvalue: {?s}\n", .{
        @TypeOf(optional_value), optional_value,
    });

    optional_value = "hi";
    assert(optional_value != null);

    print("\noptional 2\ntype: {}\nvalue: {?s}\n", .{
        @TypeOf(optional_value), optional_value,
    });

    // Error union
    var number_or_error: anyerror!i32 = error.ArgNotFound;

    print("\nerror union 1\ntype: {}\nvalue: {!}\n", .{
        @TypeOf(number_or_error), number_or_error, });

    number_or_error = 1234;

    print("\nerror union 2\ntype: {}\nvalue: {!}\n", .{
        @TypeOf(number_or_error), number_or_error,
    });

    // Personnal tests
    var unTrucOptionel: ?i64 = null;
    print("Mon optionel = {?d}: {}\n", .{unTrucOptionel, @TypeOf(unTrucOptionel)});
    unTrucOptionel = 42;
    print("Mon optionel = {?d}: {}\n", .{unTrucOptionel, @TypeOf(unTrucOptionel)});

    // Variable need to be assigned, so at least to undefined
    const bytes = "hello";
    print("{}\n", .{@TypeOf(bytes)});                   // *const [5:0]u8
    print("{d}\n", .{bytes.len});                       // 5
    print("{c}\n", .{bytes[1]});                        // 'e'
    print("{d}\n", .{bytes[5]});                        // 0
    print("{}\n", .{'e' == '\x65'});                    // true
    print("{d}\n", .{'\u{1f4a9}'});                     // 128169
    print("{d}\n", .{'💯'});                            // 128175
    print("{u}\n", .{'⚡'});
    print("{}\n", .{mem.eql(u8, "hello", "h\x65llo")});      // true
    print("{}\n", .{mem.eql(u8, "💯", "\xf0\x9f\x92\xaf")}); // also true
    const invalid_utf8 = "\xff\xfe";      // non-UTF-8 strings are possible with \xNN notation.
    print("0x{x}\n", .{invalid_utf8[1]}); // indexing them returns individual bytes...
    print("0x{x}\n\n", .{"💯"[1]});    // ...as does indexing part-way through non-ASCII characters

    var x: i32 = undefined;
    print("{d}\n", .{x});
    x = 1;
    print("{d}\n", .{x});
}

test "static local variable" {
    try expect(foo() == 1235);
    try expect(foo() == 1236);
}

fn foo() i32 {
    const S = struct {
        var x: i32 = 1234;
    };
    S.x += 1;
    return S.x;
}