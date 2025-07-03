// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Location
import protocol Catena.ResultProviding
import protocol Catenoid.Fields
import protocol DrumKitService.LocationSpec

extension API: LocationSpec where LocationSpecifiedFields: Fields<Location.Identified> {
	public typealias LocationList = Results<LocationSpecifiedFields>
}
