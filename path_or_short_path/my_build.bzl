def _impl(ctx):
    exe = ctx.actions.declare_file("{}-build.sh".format(ctx.label.name))
    ctx.actions.write(
        output = exe,
        content = """#!/bin/bash
    
set -euo pipefail
set -x

cp {src} {out}
""".format(
            src = ctx.file.src.path, # .short_path breaks for generated files
            out = ctx.outputs.out.path, # .short_path doesn't work
        ),
        is_executable = True,
    )

    ctx.actions.run(
        inputs = ctx.files.src,
        outputs = [ctx.outputs.out],
        executable = exe,
    )

my_build = rule(
    implementation = _impl,
    attrs = {
        "src": attr.label(mandatory = True, allow_single_file = True),
        "out": attr.output(mandatory = True),
    },
)
