const std = @import("std");

pub fn main() !void {
    var i: u32 = 1;

    while (i < 100) : (i += 1) {
        if (i % 3 == 0 and i % 5 == 0) {
            std.debug.print("FizzBuzz\n", .{});
        } else if (i % 3 == 0) {
            std.debug.print("Fizz\n", .{});
        } else if (i % 5 == 0) {
            std.debug.print("Buzz\n", .{});
        } else {
            std.debug.print("{d}\n", .{i});
        }
    }
}
