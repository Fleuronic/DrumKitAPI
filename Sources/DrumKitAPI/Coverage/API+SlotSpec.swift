// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Slot
import protocol Catena.ResultProviding
import protocol Catenoid.Fields
import protocol DrumKitService.SlotSpec

extension API: SlotSpec where SlotSpecifiedFields: Fields<Slot.Identified> {
	public typealias SlotList = Results<SlotSpecifiedFields>
	public typealias SlotFetch = SingleResult<SlotSpecifiedFields?>
}
