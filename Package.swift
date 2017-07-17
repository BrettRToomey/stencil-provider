import PackageDescription

let package = Package(
    name: "StencilProvider",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 2),
        .Package(url: "https://github.com/kylef/Stencil.git", majorVersion: 0, minor: 9),
    ]
)
