import Foundation
import struct DrumKit.State
import struct DrumKit.Country
import struct DrumKitService.IdentifiedState
import struct Catena.IDFields
import protocol Catenary.Fields
import protocol Catenary.Deserializable
import protocol DrumKitService.CountryFields

extension State.Identified: Catenary.Deserializable {
	public typealias Container = KeyedDecodingContainer<Path>

	public static func deserialized(from decoder: any Decoder) -> (ID, Container) {
		try! (IDFields(from: decoder).id, decoder.container(keyedBy: Path.self))
	}
}

// MARK: -
public extension State.Identified.Container {
	var abbreviation: String {
		decode(for: .abbreviation)
	}

	var countryContainer: Country.Identified.Container {
		try! nestedContainer(keyedBy: Country.Identified.Path.self, forKey: .country)
	}

	func country<T: CountryFields & Fields>() -> T {
		decode(for: .country)
	}
}
