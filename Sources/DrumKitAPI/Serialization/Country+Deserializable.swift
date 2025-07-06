import Foundation
import struct DrumKit.Country
import struct Catena.IDFields
import protocol Catenary.Fields
import protocol Catenary.Deserializable
import protocol DrumKitService.LocationFields

extension Country.Identified: Catenary.Deserializable {
	public typealias Container = KeyedDecodingContainer<Path>

	public static func deserialized(from decoder: any Decoder) -> (ID, Container) {
		try! (IDFields(from: decoder).id, decoder.container(keyedBy: Path.self))
	}
}

// MARK: -
public extension Country.Identified.Container {
	var name: String {
		decode(for: .name)
	}
}
