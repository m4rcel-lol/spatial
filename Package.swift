// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "Spatial",
    platforms: [.macOS(.v14)],
    products: [
        .executable(name: "SpatialApp", targets: ["SpatialApp"]),
        .library(name: "SpatialCore", targets: ["SpatialCore"]),
        .library(name: "SpatialGraph", targets: ["SpatialGraph"]),
        .library(name: "SpatialMetal", targets: ["SpatialMetal"]),
        .library(name: "SpatialInference", targets: ["SpatialInference"]),
        .library(name: "SpatialUI", targets: ["SpatialUI"])
    ],
    dependencies: [
        .package(url: "https://github.com/groue/GRDB.swift", from: "7.0.0")
    ],
    targets: [
        .target(
            name: "SpatialCore",
            dependencies: [
                .product(name: "GRDB", package: "GRDB.swift")
            ]
        ),
        .target(name: "SpatialGraph"),
        .target(name: "SpatialMetal", dependencies: ["SpatialGraph"], resources: [.process("Shaders")]),
        .target(name: "SpatialInference", dependencies: ["SpatialCore", "SpatialGraph"]),
        .target(name: "SpatialUI", dependencies: ["SpatialCore", "SpatialGraph", "SpatialMetal", "SpatialInference"]),
        .executableTarget(name: "SpatialApp", dependencies: ["SpatialUI"]),
        .testTarget(name: "SpatialInferenceTests", dependencies: ["SpatialInference"])
    ]
)
