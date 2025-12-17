import struct DrumKit.Time

extension Time: Swift.Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		self = try Time.value.decode(container.decode(String.self)).get()
	}
}

// MARK: -
extension Time: Swift.Encodable {
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(Time.value.encode(self))

	}
}
