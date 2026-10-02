// Copyright © Fleuronic LLC. All rights reserved.

import Foundation
import struct DrumKit.CorpsEra
import struct DrumKitService.IdentifiedCorpsEra
import struct Catena.IDFields
import protocol Catenary.Fields
import protocol Catenary.Deserializable
import protocol DrumKitService.CorpsFields
import protocol DrumKitService.LocationFields
import protocol DrumKitService.DivisionFields

extension CorpsEra.Identified: Catenary.Deserializable {
	public typealias Container = KeyedDecodingContainer<Path>

	public static func deserialized(from decoder: any Decoder) throws -> (ID, Container) {
		try (IDFields(from: decoder).id, decoder.container(keyedBy: Path.self))
	}
}

// MARK: -
public extension CorpsEra.Identified.Container {
	var fromYear: Int? {
		decode(for: .fromYear)
	}

	var throughYear: Int? {
		decode(for: .throughYear)
	}

	var name: String? {
		decode(for: .name)
	}

	func corps<T: CorpsFields & Fields>() -> T {
		decode(for: .corps)
	}

	func location<T: LocationFields & Fields>() -> T? {
		decode(for: .location)
	}

	func division<T: DivisionFields & Fields>() -> T? {
		decode(for: .division)
	}
}
