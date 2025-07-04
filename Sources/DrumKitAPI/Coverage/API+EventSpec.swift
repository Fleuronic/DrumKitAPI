// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Event
import protocol Catena.ResultProviding
import protocol Catenoid.Fields
import protocol DrumKitService.EventSpec

extension API: EventSpec where EventSpecifiedFields: Fields<Event.Identified> {
	public typealias EventList = Results<EventSpecifiedFields>
}
