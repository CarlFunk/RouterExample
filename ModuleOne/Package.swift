// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "ModuleOne",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "ModuleOne",
            targets: ["ModuleOne"]),
    ],
    dependencies: [
        .package(name: "ModuleShare", path: "../ModuleShare"),
        .package(name: "Router", url: "https://github.com/CarlFunk/Router", .upToNextMajor(from: Version(0, 2, 0)))
    ],
    targets: [
        .target(
            name: "ModuleOne",
            dependencies: [
                "ModuleShare",
                "Router"
            ])
    ]
)
