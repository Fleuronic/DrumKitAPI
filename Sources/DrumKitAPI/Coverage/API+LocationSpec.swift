

import struct DrumKit.Location
import protocol Catena.ResultProviding
import protocol Catenoid.Fields
import protocol DrumKitService.LocationSpec

extension API: LocationSpec where LocationSpecifiedFields: Fields<Location.Identified> {
	public typealias LocationFetch = SingleResult<LocationSpecifiedFields?>
}
