import Foundation
import struct DrumKit.Location
import struct DrumKit.State
import struct DrumKitService.IdentifiedLocation
import struct Catena.IDFields
import protocol Catenary.Fields
import protocol Catenary.Deserializable
import protocol DrumKitService.StateFields

extension Location.Identified: Catenary.Deserializable {
	public typealias Container = KeyedDecodingContainer<Path>

	public static func deserialized(from decoder: any Decoder) -> (ID, Container) {
		try! (IDFields(from: decoder).id, decoder.container(keyedBy: Path.self))
	}
}

// MARK: -
public extension Location.Identified.Container {
	var city: String {
		decode(for: .city)
	}

	var stateContainer: State.Identified.Container {
		try! nestedContainer(keyedBy: State.Identified.Path.self, forKey: .state)
	}

	func state<T: StateFields & Fields>() throws -> T {
		decode(for: .state)
	}
}
