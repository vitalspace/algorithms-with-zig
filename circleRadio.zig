const std = @import("std");

pub fn getPrompt(allocator: std.mem.Allocator) ![]const u8 {
    var stdin = std.io.getStdIn().reader();
    var buffer: [100]u8 = undefined;
    const bytes_read = try stdin.read(&buffer);
    const entered = buffer[0..bytes_read];
    const str = std.mem.trim(u8, entered, " \r\n\t");
    const str_copy = try allocator.alloc(u8, str.len);
    std.mem.copyForwards(u8, str_copy, str);
    return str_copy;
}

pub fn getRadio(diameter: f32) f32 {
    return diameter / 2;
}

pub fn main() !void {
    const allocator = std.heap.page_allocator;

    std.debug.print("Type Diameter: ", .{});
    const str_diameter = try getPrompt(allocator);
    defer allocator.free(str_diameter);
    const diameter = try std.fmt.parseFloat(f32, str_diameter);

    const radio = getRadio(diameter);

    std.debug.print("Radio is: {d:}", .{radio});
}
