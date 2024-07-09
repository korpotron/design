// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Design",
    products: [
        .library(
            name: "Design",
            targets: [
                "Design"
            ]
        ),
    ],
    targets: [
        .target(
            name: "Design"
        ),
        .testTarget(
            name: "DesignTests",
            dependencies: [
                "Design"
            ]
        ),
    ]
)
