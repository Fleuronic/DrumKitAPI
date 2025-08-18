

import struct DrumKit.ZIPCode
import protocol Catena.ResultProviding
import protocol Catenoid.Fields
import protocol DrumKitService.ZIPCodeSpec

extension API: ZIPCodeSpec where ZIPCodeSpecifiedFields: Fields<ZIPCode.Identified> {
	public typealias ZIPCodeFetch = SingleResult<ZIPCodeSpecifiedFields?>
}
