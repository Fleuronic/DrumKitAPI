import Foundation
import struct DrumKit.Division
import struct DrumKitService.IdentifiedDivision
import struct Catena.IDFields
import protocol Catenary.Fields
import protocol Catenary.Deserializable
import protocol DrumKitService.CircuitFields

extension Division.Identified: Catenary.Deserializable {
	public typealias Container = KeyedDecodingContainer<Path>

	public static func deserialized(from decoder: any Decoder) throws -> (ID, Container) {
		try (IDFields(from: decoder).id, decoder.container(keyedBy: Path.self))
	}
}

// MARK: -
public extension Division.Identified.Container {
	var name: String {
		decode(for: .name)
	}

	func circuit<T: CircuitFields & Fields>() -> T {
		decode(for: .circuit)
	}
}
