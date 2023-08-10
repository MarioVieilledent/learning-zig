const print = @import("std").debug.print;
const mem = @import("std").mem;

pub fn main() void {
    const bytes = "hello";
    print("{}\n", .{@TypeOf(bytes)}); // [5:0] u8
    print("{d}\n", .{bytes.len}); // 5
    print("{c}\n", .{bytes[1]}); // 'e'
    print("{d}\n", .{bytes[5]}); // 0
    print("{}\n", .{bytes[5]}); // 0 ?
    print("{c}\n", .{bytes[5]}); // \0 ?
    // print("{d}\n", .{bytes[6]}); // not possible
    print("{}\n", .{'e' == '\x65'}); // true
    print("{}\n", .{'e' == 101}); // true ?
    print("{d}\n", .{'\u{1f4a9}'}); // ???
    print("{d}\n", .{'💯'});
    print("{u}\n", .{'⚡'});
    print("{}\n", .{mem.eql(u8, "hello", "h\x65llo")});
    print("{}\n", .{mem.eql(u8, "💯", "\xf0\x9f\x92\xaf")});
    const invalid_utf8 = "\xff\xfe";
    print("0x{x}\n", .{invalid_utf8[1]});
    print("0x{x}\n\n", .{"💯"[1]});

    // print("{}\n", .{str[4]});

    const a: i32 = undefined;
    print("Value of undefined i32 = {}\n", .{a});
    const b: u8 = undefined;
    print("Value of undefined u8 = {}\n", .{b});
    const c: f64 = undefined;
    print("Value of undefined f64 = {}\n", .{c});
    const d: bool = undefined;
    print("Value of undefined bool = {}\n", .{d});

    const megaFloat: f16 = 123.00003210000;
    print("Value of megaFloat = {}\n", .{megaFloat});
}
