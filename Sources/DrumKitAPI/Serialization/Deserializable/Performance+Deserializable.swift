import Foundation
import struct DrumKit.Performance
import struct DrumKit.Corps
import struct DrumKit.Ensemble
import struct DrumKit.Placement
import struct DrumKitService.IdentifiedPerformance
import struct Catena.IDFields
import protocol Catenary.Fields
import protocol Catenary.Deserializable
import protocol DrumKitService.CorpsFields
import protocol DrumKitService.EnsembleFields
import protocol DrumKitService.PlacementFields

extension Performance.Identified: Catenary.Deserializable {
	public typealias Container = KeyedDecodingContainer<Path>

	public static func deserialized(from decoder: any Decoder) throws -> (ID, Container) {
		try (IDFields(from: decoder).id, decoder.container(keyedBy: Path.self))
	}
}

// MARK: -
public extension Performance.Identified.Container {
	var corpsContainer: Corps.Identified.Container? {
		try? nestedContainer(keyedBy: Corps.Identified.Path.self, forKey: .corps)
	}

	var ensembleContainer: Ensemble.Identified.Container? {
		try? nestedContainer(keyedBy: Ensemble.Identified.Path.self, forKey: .ensemble)
	}

	var placementContainer: Placement.Identified.Container? {
		try? nestedContainer(keyedBy: Placement.Identified.Path.self, forKey: .placement)
	}

	func corps<T: CorpsFields & Fields>() -> T? {
		decode(for: .corps)
	}

	func ensemble<T: EnsembleFields & Fields>() -> T? {
		decode(for: .ensemble)
	}

	func placement<T: PlacementFields & Fields>() -> T? {
		decode(for: .placement)
	}
}
