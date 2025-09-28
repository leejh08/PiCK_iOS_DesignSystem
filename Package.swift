// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PiCK_iOS_DesignSystem",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "PiCK_iOS_DesignSystem",
            targets: ["PiCK_iOS_DesignSystem"]),
    ],
    targets: [
        .target(
            name: "PiCK_iOS_DesignSystem",
            path: "PiCK_iOS_DesignSystem"
        )
    ]
)
