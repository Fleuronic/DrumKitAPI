// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Venue
import protocol Catena.ResultProviding
import protocol Catenoid.Fields
import protocol DrumKitService.VenueSpec

extension API: VenueSpec where VenueSpecifiedFields: Fields<Venue.Identified> {
	public typealias VenueList = Results<VenueSpecifiedFields>
}
