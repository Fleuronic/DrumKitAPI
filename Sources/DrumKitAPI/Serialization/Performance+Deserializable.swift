import Foundation
import struct DrumKit.Performance
import struct DrumKit.Corps
import struct DrumKitService.IdentifiedPerformance
import struct Catena.IDFields
import protocol Catenary.Fields
import protocol Catenary.Deserializable
import protocol DrumKitService.CorpsFields

extension Performance.Identified: Catenary.Deserializable {
	public typealias Container = KeyedDecodingContainer<Path>

	public static func deserialized(from decoder: any Decoder) -> (ID, Container) {
		try! (IDFields(from: decoder).id, decoder.container(keyedBy: Path.self))
	}
}

// MARK: -
public extension Performance.Identified.Container {
	var corpsContainer: Corps.Identified.Container? {
		try? nestedContainer(keyedBy: Corps.Identified.Path.self, forKey: .corps)
	}

	func corps<T: CorpsFields & Fields>() -> T? {
		decode(for: .corps)
	}
}
