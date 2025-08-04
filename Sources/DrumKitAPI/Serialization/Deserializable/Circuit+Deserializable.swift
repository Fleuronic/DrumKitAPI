import Foundation
import struct DrumKit.Circuit
import struct DrumKitService.IdentifiedCircuit
import struct Catena.IDFields
import protocol Catenary.Fields
import protocol Catenary.Deserializable

extension Circuit.Identified: Catenary.Deserializable {
	public typealias Container = KeyedDecodingContainer<Path>

	public static func deserialized(from decoder: any Decoder) throws -> (ID, Container) {
		try (IDFields(from: decoder).id, decoder.container(keyedBy: Path.self))
	}
}

// MARK: -
public extension Circuit.Identified.Container {
	var name: String {
		decode(for: .name)
	}

	var abbreviation: String {
		decode(for: .abbreviation)
	}
}
