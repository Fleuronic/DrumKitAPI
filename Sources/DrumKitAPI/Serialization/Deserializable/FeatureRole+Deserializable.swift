// Copyright © Fleuronic LLC. All rights reserved.

import Foundation
import struct DrumKit.FeatureRole
import struct DrumKitService.IdentifiedFeatureRole
import struct Catena.IDFields
import protocol Catenary.Fields
import protocol Catenary.Deserializable
import protocol DrumKitService.FeatureFields

extension FeatureRole.Identified: Catenary.Deserializable {
	public typealias Container = KeyedDecodingContainer<Path>

	public static func deserialized(from decoder: any Decoder) throws -> (ID, Container) {
		try (IDFields(from: decoder).id, decoder.container(keyedBy: Path.self))
	}
}

// MARK: -
public extension FeatureRole.Identified.Container {
	var role: String {
		decode(for: .role)
	}

	func feature<T: FeatureFields & Fields>() -> T {
		decode(for: .feature)
	}
}
