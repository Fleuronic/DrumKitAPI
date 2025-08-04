

import struct DrumKit.Show
import protocol Catena.ResultProviding
import protocol Catenoid.Fields
import protocol DrumKitService.ShowSpec

extension API: ShowSpec where ShowSpecifiedFields: Fields<Show.Identified> {
	public typealias ShowFetch = SingleResult<ShowSpecifiedFields?>
}
