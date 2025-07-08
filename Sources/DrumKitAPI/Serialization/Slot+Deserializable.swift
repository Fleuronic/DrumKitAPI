import Foundation
import struct DrumKit.Slot
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

	public static func deserialized(from decoder: any Decoder) -> (ID, Container) {
		try! (IDFields(from: decoder).id, decoder.container(keyedBy: Path.self))
	}
}

// MARK: -
public extension Slot.Identified.Container {
	var time: TimeInterval? {
		guard let timeString: String = decode(for: .time) else { return nil }

		let formatString: Date.FormatString = "\(hour: .twoDigits(clock: .twentyFourHour, hourCycle: .zeroBased)):\(minute: .twoDigits):\(second: .twoDigits)\(timeZone: .iso8601(.short))"
		let formatStyle = Date.VerbatimFormatStyle(
			format: formatString,
			timeZone: .init(secondsFromGMT: 0)!,
			calendar: .current
		)

		return try! Date(timeString, strategy: formatStyle.parseStrategy).timeIntervalSince1970
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
