// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Design",
    platforms: [
        .iOS(.v16),
    ],
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
            name: "Design",
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "DesignTests",
            dependencies: [
                "Design"
            ]
        ),
    ]
)
