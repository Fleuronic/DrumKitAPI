import Foundation
import struct DrumKit.Event
import struct DrumKit.Show
import struct DrumKitService.IdentifiedEvent
import struct Catena.IDFields
import protocol Catenary.Fields
import protocol Catenary.Deserializable
import protocol DrumKitService.CircuitFields
import protocol DrumKitService.LocationFields
import protocol DrumKitService.ShowFields
import protocol DrumKitService.VenueFields
import protocol DrumKitService.SlotFields

extension Event.Identified: Catenary.Deserializable {
	public typealias Container = KeyedDecodingContainer<Path>

	public static func deserialized(from decoder: any Decoder) throws -> (ID, Container) {
		try (IDFields(from: decoder).id, decoder.container(keyedBy: Path.self))
	}
}

// MARK: -
public extension Event.Identified.Container {
	var date: Date {
		try! .init(
			decode(for: .date),
			strategy: Date.ParseStrategy(
				format: "\(year: .defaultDigits)-\(month: .twoDigits)-\(day: .twoDigits)",
				timeZone: .current
			)
		)
	}

	var detailsURL: URL? {
		decode(for: .detailsURL)
	}
	
	var scoresURL: URL? {
		decode(for: .scoresURL)
	}

	var showContainer: Show.Identified.Container? {
		try? nestedContainer(keyedBy: Show.Identified.Path.self, forKey: .show)
	}

	func location<T: LocationFields & Fields>() -> T {
		decode(for: .location)
	}

	func circuit<T: CircuitFields & Fields>() -> T? {
		decode(for: .circuit)
	}

	func show<T: ShowFields & Fields>() -> T? {
		decode(for: .show)
	}

	func venue<T: VenueFields & Fields>() -> T? {
		decode(for: .venue)
	}
	
	func slots<T: SlotFields & Fields>() -> [T] {
		decode(for: .slots)
	}
}
