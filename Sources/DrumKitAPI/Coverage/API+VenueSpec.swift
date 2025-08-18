

import struct DrumKit.Venue
import protocol Catena.ResultProviding
import protocol Catenoid.Fields
import protocol DrumKitService.VenueSpec

extension API: VenueSpec where VenueSpecifiedFields: Fields<Venue.Identified> {
	public typealias VenueFetch = SingleResult<VenueSpecifiedFields?>
}
