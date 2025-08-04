import Foundation
import struct DrumKit.Slot
import struct DrumKit.Time
import struct DrumKit.Performance
import struct DrumKit.Feature
import struct DrumKitService.IdentifiedSlot
import struct Catena.IDFields
import protocol Catenary.Fields
import protocol Catenary.Deserializable
import protocol DrumKitService.PerformanceFields
import protocol DrumKitService.FeatureFields

extension Slot.Identified: Catenary.Deserializable {
	public typealias Container = KeyedDecodingContainer<Path>

	public static func deserialized(from decoder: any Decoder) throws -> (ID, Container) {
		try (IDFields(from: decoder).id, decoder.container(keyedBy: Path.self))
	}
}

// MARK: -
public extension Slot.Identified.Container {
	var time: Time? {
		decode(for: .time)
	}

	var performanceContainer: Performance.Identified.Container? {
		try? nestedContainer(keyedBy: Performance.Identified.Path.self, forKey: .performance)
	}

	var featureContainer: Feature.Identified.Container? {
		try? nestedContainer(keyedBy: Feature.Identified.Path.self, forKey: .feature)
	}

	func performance<T: PerformanceFields & Fields>() -> T? {
		decode(for: .performance)
	}

	func feature<T: FeatureFields & Fields>() -> T? {
		decode(for: .feature)
	}
}
