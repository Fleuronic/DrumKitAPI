import Foundation
import struct DrumKit.Venue
import struct DrumKit.Address
import struct DrumKitService.IdentifiedVenue
import struct Catena.IDFields
import protocol Catenary.Fields
import protocol Catenary.Deserializable
import protocol DrumKitService.AddressFields

extension Venue.Identified: Catenary.Deserializable {
	public typealias Container = KeyedDecodingContainer<Path>

	public static func deserialized(from decoder: any Decoder) throws -> (ID, Container) {
		try (IDFields(from: decoder).id, decoder.container(keyedBy: Path.self))
	}
}

// MARK: -
public extension Venue.Identified.Container {
	var name: String {
		decode(for: .name)
	}

	var host: String? {
		decode(for: .host)
	}

	var addressContainer: Address.Identified.Container {
		try! nestedContainer(keyedBy: Address.Identified.Path.self, forKey: .address)
	}

	func address<T: AddressFields & Fields>() -> T {
		decode(for: .address)
	}
}
