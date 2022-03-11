// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ModuleShare",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "ModuleShare",
            targets: ["ModuleShare"])
    ],
    dependencies: [
        .package(name: "Router", url: "https://github.com/CarlFunk/Router", .upToNextMajor(from: Version(0, 2, 0)))
    ],
    targets: [
        .target(
            name: "ModuleShare",
            dependencies: [
                "Router"
            ])
    ]
)
