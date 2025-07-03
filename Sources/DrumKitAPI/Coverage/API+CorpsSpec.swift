// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Corps
import protocol Catena.ResultProviding
import protocol Catenoid.Fields
import protocol DrumKitService.CorpsSpec

extension API: CorpsSpec where CorpsSpecifiedFields: Fields<Corps.Identified> {
	public typealias CorpsList = Results<CorpsSpecifiedFields>
}
