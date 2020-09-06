// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-rest-client",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "RESTClient",
            targets: ["RESTClient"]),
    ],
    dependencies: [
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.46.2"),
        .package(url: "https://github.com/realm/SwiftLint", from: "0.40.1"),
        .package(url: "https://github.com/OpenCombine/OpenCombine.git", from: "0.10.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "RESTClient",
            dependencies: [
                "OpenCombine",
                .product(name: "OpenCombineDispatch", package: "OpenCombine"),
                .product(name: "OpenCombineFoundation", package: "OpenCombine"),
            ]),
        .testTarget(
            name: "RESTClientTests",
            dependencies: ["RESTClient"]),
    ]
)
