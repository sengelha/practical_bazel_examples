def _impl(ctx):
    executable = ctx.actions.declare_file(ctx.attr.name)

    args = ctx.actions.args()
    args.add("-o", executable)
    args.add_all(ctx.files.srcs)

    ctx.actions.run(
        inputs = ctx.files.srcs,
        outputs = [executable],
        # This is for demo purposes.  In a real Bazel rule you'd
        # want to use cc_common.
        executable = "/usr/bin/gcc",
        arguments = [args],
    )
    return [
        DefaultInfo(
            executable = executable,
            files = depset([executable]),
        ),
    ]

my_cc_binary = rule(
    implementation = _impl,
    attrs = {
        "srcs": attr.label_list(
            mandatory = True,
            allow_files = True,
        ),
    },
    executable = True,
)
