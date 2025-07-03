// Copyright © Fleuronic LLC. All rights reserved.

import Catenary
import struct DrumKit.Corps
import struct DrumKitService.IdentifiedCorps

extension Corps: Swift.Decodable {
	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: Identified.Path.self)
		try self.init(
			name: container.decode(for: .name)
		)
	}
}
