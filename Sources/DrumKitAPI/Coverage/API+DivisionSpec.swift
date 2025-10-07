

import struct DrumKit.Division
import protocol Catena.ResultProviding
import protocol Catenoid.Fields
import protocol DrumKitService.DivisionSpec

extension API: DivisionSpec where DivisionSpecifiedFields: Fields<Division.Identified> {
	public typealias DivisionFetch = SingleResult<DivisionSpecifiedFields?>
}
