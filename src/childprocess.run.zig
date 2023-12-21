const std = @import("std");
pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer std.debug.assert(gpa.deinit() == .ok);

    const build_date = blk: {
        const result = try std.ChildProcess.run(.{ .allocator = allocator, .argv = &.{ "date", "+%Y-%m-%dT%H:%M:%S%z" } });
        break :blk result.stdout;
    };
    defer allocator.free(build_date);
    std.debug.print("Build at: {s}", .{build_date});
}
