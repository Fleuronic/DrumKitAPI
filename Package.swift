// swift-tools-version:6.0
import PackageDescription

let package = Package(
	name: "DrumKitAPI",
	platforms: [
		.iOS(.v15),
		.macOS(.v12),
		.tvOS(.v15),
		.watchOS(.v8)
	],
	products: [
		.library(
			name: "DrumKitAPI",
			targets: ["DrumKitAPI"]
		),
	],
	dependencies: [.package(url: "https://github.com/Fleuronic/DrumKitService", branch: "main")],
	targets: [
		.target(
			name: "DrumKitAPI",
			dependencies: ["DrumKitService"]
		)
	],
	swiftLanguageModes: [.v6]
)

for target in package.targets {
	target.swiftSettings = [
		.enableExperimentalFeature("StrictConcurrency")
	]
}
