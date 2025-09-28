// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "PiCK_iOS_DesignSystem",
    platforms: [
        .iOS(.v15)   // iOS 전용 명시
    ],
    products: [
        .library(
            name: "PiCK_iOS_DesignSystem",
            targets: ["PiCK_iOS_DesignSystem"]
        ),
    ],
    targets: [
        .target(
            name: "PiCK_iOS_DesignSystem",
            path: "PiCK_iOS_DesignSystem",
            resources: [
                .process("Resources") // 폰트, 이미지, json 등 포함
            ]
        )
    ]
)
