// Copyright © Fleuronic LLC. All rights reserved.

import Foundation
import struct DrumKit.DivisionRank
import struct DrumKitService.IdentifiedDivisionRank
import struct Catena.IDFields
import protocol Catenary.Fields
import protocol Catenary.Deserializable
import protocol DrumKitService.DivisionFields

extension DivisionRank.Identified: Catenary.Deserializable {
	public typealias Container = KeyedDecodingContainer<Path>

	public static func deserialized(from decoder: any Decoder) throws -> (ID, Container) {
		try (IDFields(from: decoder).id, decoder.container(keyedBy: Path.self))
	}
}

// MARK: -
public extension DivisionRank.Identified.Container {
	var rank: Int {
		decode(for: .rank)
	}

	func division<T: DivisionFields & Fields>() -> T {
		decode(for: .division)
	}
}
