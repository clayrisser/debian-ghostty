const c = @import("c.zig").c;

/// Verifies that the GTK version is at least the given version.
///
/// This can be run in both a comptime and runtime context. If it
/// is run in a comptime context, it will only check the version
/// in the headers. If it is run in a runtime context, it will
/// check the actual version of the library we are linked against.
///
/// This function should be used in cases where the version check
/// would affect code generation, such as using symbols that are
/// only available beyond a certain version. For checks which only
/// depend on GTK's runtime behavior, use `runtimeAtLeast`.
///
/// This is inlined so that the comptime checks will disable the
/// runtime checks if the comptime checks fail.
pub inline fn atLeast(
    comptime major: u16,
    comptime minor: u16,
    comptime micro: u16,
) bool {
    // If our header has lower versions than the given version,
    // we can return false immediately. This prevents us from
    // compiling against unknown symbols and makes runtime checks
    // very slightly faster.
    if (comptime c.GTK_MAJOR_VERSION < major or
        (c.GTK_MAJOR_VERSION == major and c.GTK_MINOR_VERSION < minor) or
        (c.GTK_MAJOR_VERSION == major and c.GTK_MINOR_VERSION == minor and c.GTK_MICRO_VERSION < micro))
        return false;

    // If we're in comptime then we can't check the runtime version.
    if (@inComptime()) return true;

    return runtimeAtLeast(major, minor, micro);
}

/// Verifies that the GTK version at runtime is at least the given
/// version.
///
/// This function should be used in cases where the only the runtime
/// behavior is affected by the version check. For checks which would
/// affect code generation, use `atLeast`.
pub inline fn runtimeAtLeast(
    comptime major: u16,
    comptime minor: u16,
    comptime micro: u16,
) bool {
    // We use the functions instead of the constants such as
    // c.GTK_MINOR_VERSION because the function gets the actual
    // runtime version.
    if (c.gtk_get_major_version() >= major) {
        if (c.gtk_get_major_version() > major) return true;
        if (c.gtk_get_minor_version() >= minor) {
            if (c.gtk_get_minor_version() > minor) return true;
            return c.gtk_get_micro_version() >= micro;
        }
    }

    return false;
}

test "atLeast" {
    const std = @import("std");
    const testing = std.testing;

    const funs = &.{ atLeast, runtimeAtLeast };
    inline for (funs) |fun| {
        try testing.expect(fun(c.GTK_MAJOR_VERSION, c.GTK_MINOR_VERSION, c.GTK_MICRO_VERSION));

        try testing.expect(!fun(c.GTK_MAJOR_VERSION, c.GTK_MINOR_VERSION, c.GTK_MICRO_VERSION + 1));
        try testing.expect(!fun(c.GTK_MAJOR_VERSION, c.GTK_MINOR_VERSION + 1, c.GTK_MICRO_VERSION));
        try testing.expect(!fun(c.GTK_MAJOR_VERSION + 1, c.GTK_MINOR_VERSION, c.GTK_MICRO_VERSION));

        try testing.expect(fun(c.GTK_MAJOR_VERSION - 1, c.GTK_MINOR_VERSION, c.GTK_MICRO_VERSION));
        try testing.expect(fun(c.GTK_MAJOR_VERSION - 1, c.GTK_MINOR_VERSION + 1, c.GTK_MICRO_VERSION));
        try testing.expect(fun(c.GTK_MAJOR_VERSION - 1, c.GTK_MINOR_VERSION, c.GTK_MICRO_VERSION + 1));

        try testing.expect(fun(c.GTK_MAJOR_VERSION, c.GTK_MINOR_VERSION - 1, c.GTK_MICRO_VERSION + 1));
    }
}
