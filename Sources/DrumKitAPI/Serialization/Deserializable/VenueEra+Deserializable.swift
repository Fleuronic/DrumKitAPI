// Copyright © Fleuronic LLC. All rights reserved.

import Foundation
import struct DrumKit.VenueEra
import struct DrumKitService.IdentifiedVenueEra
import struct Catena.IDFields
import protocol Catenary.Fields
import protocol Catenary.Deserializable
import protocol DrumKitService.VenueFields

extension VenueEra.Identified: Catenary.Deserializable {
	public typealias Container = KeyedDecodingContainer<Path>

	public static func deserialized(from decoder: any Decoder) throws -> (ID, Container) {
		try (IDFields(from: decoder).id, decoder.container(keyedBy: Path.self))
	}
}

// MARK: -
public extension VenueEra.Identified.Container {
	var fromYear: Int? {
		decode(for: .fromYear)
	}

	var throughYear: Int? {
		decode(for: .throughYear)
	}

	var name: String {
		decode(for: .name)
	}

	func venue<T: VenueFields & Fields>() -> T {
		decode(for: .venue)
	}
}
