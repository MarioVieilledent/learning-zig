const expect = @import("std").testing.expect;

test "integer overflow" {
    var a: u8 = 254;
    a += 1;
    try expect(a == 255);
    a +%= 1; // Wouldn't be possible with a += operator
    try expect(a == 0);
}