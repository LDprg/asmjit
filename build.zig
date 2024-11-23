const std = @import("std");
const protobuf = @import("protobuf");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "asmjit",
        .target = target,
        .optimize = optimize,
    });

    lib.addIncludePath(b.path("src"));

    lib.addCSourceFiles(.{
        .root = b.path("src"),
        .files = &.{
            "asmjit/core/archtraits.cpp",
            "asmjit/core/assembler.cpp",
            "asmjit/core/builder.cpp",
            "asmjit/core/codeholder.cpp",
            "asmjit/core/codewriter.cpp",
            "asmjit/core/compiler.cpp",
            "asmjit/core/constpool.cpp",
            "asmjit/core/cpuinfo.cpp",
            "asmjit/core/emithelper.cpp",
            "asmjit/core/emitter.cpp",
            "asmjit/core/emitterutils.cpp",
            "asmjit/core/environment.cpp",
            "asmjit/core/errorhandler.cpp",
            "asmjit/core/formatter.cpp",
            "asmjit/core/func.cpp",
            "asmjit/core/funcargscontext.cpp",
            "asmjit/core/globals.cpp",
            "asmjit/core/inst.cpp",
            "asmjit/core/instdb.cpp",
            "asmjit/core/jitallocator.cpp",
            "asmjit/core/jitruntime.cpp",
            "asmjit/core/logger.cpp",
            "asmjit/core/operand.cpp",
            "asmjit/core/osutils.cpp",
            "asmjit/core/ralocal.cpp",
            "asmjit/core/rapass.cpp",
            "asmjit/core/rastack.cpp",
            "asmjit/core/string.cpp",
            "asmjit/core/support.cpp",
            "asmjit/core/target.cpp",
            "asmjit/core/type.cpp",
            "asmjit/core/virtmem.cpp",
            "asmjit/core/zone.cpp",
            "asmjit/core/zonehash.cpp",
            "asmjit/core/zonelist.cpp",
            "asmjit/core/zonestack.cpp",
            "asmjit/core/zonetree.cpp",
            "asmjit/core/zonevector.cpp",
            "asmjit/arm/armformatter.cpp",
            "asmjit/arm/a64assembler.cpp",
            "asmjit/arm/a64builder.cpp",
            "asmjit/arm/a64compiler.cpp",
            "asmjit/arm/a64emithelper.cpp",
            "asmjit/arm/a64formatter.cpp",
            "asmjit/arm/a64func.cpp",
            "asmjit/arm/a64instapi.cpp",
            "asmjit/arm/a64instdb.cpp",
            "asmjit/arm/a64operand.cpp",
            "asmjit/arm/a64rapass.cpp",
            "asmjit/x86/x86assembler.cpp",
            "asmjit/x86/x86builder.cpp",
            "asmjit/x86/x86compiler.cpp",
            "asmjit/x86/x86emithelper.cpp",
            "asmjit/x86/x86formatter.cpp",
            "asmjit/x86/x86func.cpp",
            "asmjit/x86/x86instdb.cpp",
            "asmjit/x86/x86instapi.cpp",
            "asmjit/x86/x86operand.cpp",
            "asmjit/x86/x86rapass.cpp",
        },
    });

    lib.linkLibC();
    lib.linkLibCpp();

    b.installArtifact(lib);
}
