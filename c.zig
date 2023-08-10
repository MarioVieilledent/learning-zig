pub fn main() void {
    var a: ?i32 = null;
    var b: i32 = a orelse 42; // 42 because a == null
    a = 12;
    // a orelse b is equivalent to if (a != null) a else b
    b = if (a != null) a.? else 42; // 12 because a != null
}
