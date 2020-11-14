// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "LVGLSwiftDemo",
    platforms: [
        .macOS(.v10_12),
    ],
    dependencies: [
        .package(url: "https://github.com/mr-j-tree/CLVGLSwift.git", .branch("main")),
        .package(url: "https://github.com/PureSwift/SDL.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "LVGLSwiftDemo",
            dependencies: ["CLVGLSwift", "SDL"]),
        .testTarget(
            name: "LVGLSwiftDemoTests",
            dependencies: ["LVGLSwiftDemo"]),
    ]
)
