// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "grpc",
    platforms: [
       .macOS(.v10_15)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0-beta"),
         .package(url: "https://github.com/grpc/grpc-swift.git", from: "1.0.0-alpha.6"),
    ],
    targets: [
        .target(name: "App", dependencies: [
            "Vapor",
            "GRPC",
        ]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App", "XCTVapor"])
    ]
)
