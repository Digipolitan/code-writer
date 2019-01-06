// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CodeWriter",
    products: [
        .library(name: "CodeWriter",
                 targets: ["CodeWriter"])
    ],
    targets: [
        .target(
            name: "CodeWriter",
            dependencies: []),
        .testTarget(
            name: "CodeWriterTests",
            dependencies: ["CodeWriter"])
    ]
)
