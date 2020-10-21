genrule(
    name = "build_libpng",
    srcs = glob(["**"]),
    outs = ["libpng16.a"],
    cmd = """
set -euo pipefail

( cd external/libpng && ./configure )
make -C external/libpng
cp external/libpng/.libs/libpng16.a $(location libpng16.a)
"""
)
