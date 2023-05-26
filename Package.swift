// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "jwt",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(name: "JWT", targets: ["JWT"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/jwt-kit.git", from: "4.0.0"),
        .package(url: "https://github.com/superluminalengineering/vapor", branch: "main"),
    ],
    targets: [
        .target(name: "JWT", dependencies: [
            .product(name: "JWTKit", package: "jwt-kit"),
            .product(name: "Vapor", package: "vapor"),
        ]),
        .testTarget(name: "JWTTests", dependencies: [
            .target(name: "JWT"),
            .product(name: "XCTVapor", package: "vapor"),
        ]),
    ]
)
