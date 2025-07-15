// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "BatchFirebaseDispatcher",
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "BatchFirebaseDispatcher",
            targets: ["BatchFirebaseDispatcher"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/BatchLabs/Batch-iOS-SDK","3.0.1"..."99.0.0"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk", "8.10.0"..."99.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "BatchFirebaseDispatcher",
            dependencies: [
                .product(name: "Batch", package: "Batch-iOS-SDK"),
                .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
            ],
            path: "BatchFirebaseDispatcher",
            publicHeadersPath: "Classes/"),
        .testTarget(
            name: "BatchFirebaseDispatcherTests",
            dependencies: ["BatchFirebaseDispatcher"],
            path: "BatchFirebaseDispatcherTests"
        ),
    ]
)
