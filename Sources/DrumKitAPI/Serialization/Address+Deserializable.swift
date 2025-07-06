import Foundation
import struct DrumKit.Address
import struct DrumKit.Location
import struct DrumKit.ZIPCode
import struct Catena.IDFields
import protocol Catenary.Fields
import protocol Catenary.Deserializable
import protocol DrumKitService.LocationFields
import protocol DrumKitService.ZIPCodeFields

extension Address.Identified: Catenary.Deserializable {
	public typealias Container = KeyedDecodingContainer<Path>

	public static func deserialized(from decoder: any Decoder) -> (ID, Container) {
		try! (IDFields(from: decoder).id, decoder.container(keyedBy: Path.self))
	}
}

// MARK: -
public extension Address.Identified.Container {
	var streetAddress: String {
		decode(for: .streetAddress)
	}

	var locationContainer: Location.Identified.Container {
		try! nestedContainer(keyedBy: Location.Identified.Path.self, forKey: .location)
	}

	var zipCodeContainer: ZIPCode.Identified.Container {
		try! nestedContainer(keyedBy: ZIPCode.Identified.Path.self, forKey: .zipCode)
	}

	func location<T: LocationFields & Fields>() -> T {
		decode(for: .location)
	}

	func zipCode<T: ZIPCodeFields & Fields>() -> T {
		decode(for: .zipCode)
	}
}
