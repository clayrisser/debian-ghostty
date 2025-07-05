const GhosttyXCFramework = @This();

const std = @import("std");
const Config = @import("Config.zig");
const SharedDeps = @import("SharedDeps.zig");
const GhosttyLib = @import("GhosttyLib.zig");
const XCFrameworkStep = @import("XCFrameworkStep.zig");

xcframework: *XCFrameworkStep,
macos: GhosttyLib,

pub fn init(b: *std.Build, deps: *const SharedDeps) !GhosttyXCFramework {
    // Create our universal macOS static library.
    const macos = try GhosttyLib.initMacOSUniversal(b, deps);

    // iOS
    const ios = try GhosttyLib.initStatic(b, &try deps.retarget(
        b,
        b.resolveTargetQuery(.{
            .cpu_arch = .aarch64,
            .os_tag = .ios,
            .os_version_min = Config.osVersionMin(.ios),
            .abi = null,
        }),
    ));

    // iOS Simulator
    const ios_sim = try GhosttyLib.initStatic(b, &try deps.retarget(
        b,
        b.resolveTargetQuery(.{
            .cpu_arch = .aarch64,
            .os_tag = .ios,
            .os_version_min = Config.osVersionMin(.ios),
            .abi = .simulator,
        }),
    ));

    // The xcframework wraps our ghostty library so that we can link
    // it to the final app built with Swift.
    const xcframework = XCFrameworkStep.create(b, .{
        .name = "GhosttyKit",
        .out_path = "macos/GhosttyKit.xcframework",
        .libraries = &.{
            .{
                .library = macos.output,
                .headers = b.path("include"),
            },
            .{
                .library = ios.output,
                .headers = b.path("include"),
            },
            .{
                .library = ios_sim.output,
                .headers = b.path("include"),
            },
        },
    });

    return .{
        .xcframework = xcframework,
        .macos = macos,
    };
}

pub fn install(self: *const GhosttyXCFramework) void {
    const b = self.xcframework.step.owner;
    b.getInstallStep().dependOn(self.xcframework.step);
}
