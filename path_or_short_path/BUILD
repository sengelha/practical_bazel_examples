load("my_build.bzl", "my_build")
load("my_test.bzl", "my_test")
load("my_executable.bzl", "my_executable")

my_build(
    name = "build",
    src = "hello_world.txt",
    out = "hello_world2.txt",
)

my_build(
    name = "build2",
    src = "hello_world2.txt",
    out = "hello_world3.txt",
)

my_test(
    name = "test",
    src = "hello_world.txt",
)

my_test(
    name = "test2",
    src = "hello_world2.txt",
)

my_test(
    name = "test3",
    src = "hello_world3.txt",
)

my_executable(
    name = "exe",
    src = "hello_world.txt",
)

my_executable(
    name = "exe2",
    src = "hello_world2.txt",
)

my_executable(
    name = "exe3",
    src = "hello_world3.txt",
)
