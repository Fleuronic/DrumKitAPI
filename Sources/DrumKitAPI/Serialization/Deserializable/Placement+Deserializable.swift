import Foundation
import struct DrumKit.Placement
import struct DrumKit.Division
import struct DrumKitService.IdentifiedPlacement
import struct Catena.IDFields
import protocol Catenary.Fields
import protocol Catenary.Deserializable
import protocol DrumKitService.PlacementFields
import protocol DrumKitService.DivisionFields

extension Placement.Identified: Catenary.Deserializable {
	public typealias Container = KeyedDecodingContainer<Path>

	public static func deserialized(from decoder: any Decoder) throws -> (ID, Container) {
		try (IDFields(from: decoder).id, decoder.container(keyedBy: Path.self))
	}
}

// MARK: -
public extension Placement.Identified.Container {
	var rank: Int {
		decode(for: .rank)
	}

	var score: Double {
		decode(for: .score)
	}

	var divisionContainer: Division.Identified.Container? {
		try? nestedContainer(keyedBy: Division.Identified.Path.self, forKey: .division)
	}

	func division<T: DivisionFields & Fields>() -> T? {
		decode(for: .division)
	}
}
