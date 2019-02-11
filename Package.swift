// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ColorSetKit",
    products: [
        .library(
            name: "ColorSetKit",
            targets: ["ColorSetKit"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ColorSetKit",
            dependencies: []),
    ]
)
