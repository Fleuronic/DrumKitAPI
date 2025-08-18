

import struct DrumKit.Address
import protocol Catena.ResultProviding
import protocol Catenoid.Fields
import protocol DrumKitService.AddressSpec

extension API: AddressSpec where AddressSpecifiedFields: Fields<Address.Identified> {
	public typealias AddressFetch = SingleResult<AddressSpecifiedFields?>
}
