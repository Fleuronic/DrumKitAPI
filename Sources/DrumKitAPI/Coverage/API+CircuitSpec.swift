

import struct DrumKit.Circuit
import protocol Catena.ResultProviding
import protocol Catenoid.Fields
import protocol DrumKitService.CircuitSpec

extension API: CircuitSpec where CircuitSpecifiedFields: Fields<Circuit.Identified> {
	public typealias CircuitFetch = SingleResult<CircuitSpecifiedFields?>
}
