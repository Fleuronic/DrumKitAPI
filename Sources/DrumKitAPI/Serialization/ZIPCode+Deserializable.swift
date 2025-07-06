import Foundation
import struct DrumKit.ZIPCode
import struct DrumKitService.IdentifiedZIPCode
import struct Catena.IDFields
import protocol Catenary.Deserializable

extension ZIPCode.Identified: Catenary.Deserializable {
	public typealias Container = KeyedDecodingContainer<Path>

	public static func deserialized(from decoder: any Decoder) -> (ID, Container) {
		try! (IDFields(from: decoder).id, decoder.container(keyedBy: Path.self))
	}
}

// MARK: -
public extension ZIPCode.Identified.Container {
	var code: String {
		decode(for: .code)
	}
}
