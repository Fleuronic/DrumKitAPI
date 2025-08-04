

import struct DrumKit.Country
import protocol Catena.ResultProviding
import protocol Catenoid.Fields
import protocol DrumKitService.CountrySpec

extension API: CountrySpec where CountrySpecifiedFields: Fields<Country.Identified> {
	public typealias CountryFetch = SingleResult<CountrySpecifiedFields?>
}
