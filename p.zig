// Test swtch expression and unions

const std = @import("std");
const expect = @import("std").testing.expect;

test "switch expression" {
    var my_bool: bool = true;
    try expect(switch (my_bool) {
        true => true,
        false => false,
    });
}

const Payload = union {
    int: i64,
    float: f64,
    boolean: bool,
};

test "simple union" {
    var payload = Payload{ .int = 1234 };
    try expect(payload.int == 1234);
    payload = Payload{ .float = 12.34 };
    try expect(payload.float == 12.34);
}

// union(enum) important here to be "switchable"
const Cell = union(enum) {
    int: isize,
    float: f64,
    text: []const u8,
    empty: void,

    fn truthy(self: Cell) bool {
        return switch (self) {
            Cell.int => |i| i != 0,
            Cell.float => |f| f != 0.0,
            Cell.text => |t| t.len > 0,
            Cell.empty => false,
        };
    }
};

test "method on union" {
    var c22 = Cell{ .text = "Salut" };
    try expect(c22.truthy());
}

test "unions" {
    var c11 = Cell{ .int = 64 };
    try expect(c11.int == 64);
    c11 = Cell{ .float = 45.2 };
    try expect(c11.float == 45.2);
    c11 = Cell{ .empty = {} }; // {} is an empty block and it's equivalent to void{}
    try expect(c11.empty == void{});
}

test "@tagName" {
    try expect(std.mem.eql(u8, @tagName(Cell.int), "int"));
}
