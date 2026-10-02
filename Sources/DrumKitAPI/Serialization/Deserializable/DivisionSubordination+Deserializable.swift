// Copyright © Fleuronic LLC. All rights reserved.

import Foundation
import struct DrumKit.DivisionSubordination
import struct DrumKitService.IdentifiedDivisionSubordination
import struct Catena.IDFields
import protocol Catenary.Fields
import protocol Catenary.Deserializable
import protocol DrumKitService.DivisionFields
import protocol DrumKitService.CircuitFields

extension DivisionSubordination.Identified: Catenary.Deserializable {
	public typealias Container = KeyedDecodingContainer<Path>

	public static func deserialized(from decoder: any Decoder) throws -> (ID, Container) {
		try (IDFields(from: decoder).id, decoder.container(keyedBy: Path.self))
	}
}

// MARK: -
public extension DivisionSubordination.Identified.Container {
	func division<T: DivisionFields & Fields>() -> T {
		decode(for: .division)
	}

	func circuit<T: CircuitFields & Fields>() -> T {
		decode(for: .circuit)
	}
}
