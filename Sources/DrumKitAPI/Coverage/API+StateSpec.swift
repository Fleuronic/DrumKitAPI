

import struct DrumKit.State
import protocol Catena.ResultProviding
import protocol Catenoid.Fields
import protocol DrumKitService.StateSpec

extension API: StateSpec where StateSpecifiedFields: Fields<State.Identified> {
	public typealias StateFetch = SingleResult<StateSpecifiedFields?>
}
