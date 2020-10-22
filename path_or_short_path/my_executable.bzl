def _impl(ctx):
    ctx.actions.write(
        output = ctx.outputs.executable,
        content = """#!/bin/bash
    
set -euo pipefail
set -x

EXPECTED="Hello World!"
ACTUAL=$(cat {src})

if [[ "$EXPECTED" != "$ACTUAL" ]]; then
    echo "Expected '$EXPECTED', actual '$ACTUAL'" 1>&2
    exit 1
fi
""".format(
            src = ctx.file.src.short_path, # .path breaks for generated files
        ),
        is_executable = True,
    )
    return [
        DefaultInfo(
            runfiles = ctx.runfiles(files = ctx.files.src),
        ),
    ]

my_executable = rule(
    implementation = _impl,
    attrs = {
        "src": attr.label(allow_single_file = True),
    },
    executable = True,
)
