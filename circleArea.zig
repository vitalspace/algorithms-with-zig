const std = @import("std");

pub fn getPrompt(allocator: std.mem.Allocator) ![]const u8 {
    var stdin = std.io.getStdIn().reader();
    var buffer: [100]u8 = undefined;
    const bytes_read = try stdin.read(&buffer);
    const entered = buffer[0..bytes_read];
    const str = std.mem.trim(u8, entered, " \r\t\n");
    const str_copy = try allocator.alloc(u8, str.len);
    std.mem.copyForwards(u8, str_copy, str);
    return str_copy;
}

pub fn getArea(radio: f32) f32 {
    const PI: f32 = 3.14;
    return PI * radio * radio;
}

pub fn main() !void {
    const allocator = std.heap.page_allocator;

    std.debug.print("Enter radio: ", .{});

    const str_radio = try getPrompt(allocator);
    defer allocator.free(str_radio);
    const radio = try std.fmt.parseFloat(f32, str_radio);

    const area = getArea(radio);

    std.debug.print("The area is: {d:}\n", .{area});
}
