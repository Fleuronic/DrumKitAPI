// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.CorpsEra
import struct DrumKit.DivisionRank
import struct DrumKit.DivisionSubordination
import struct DrumKit.FeatureRole
import struct DrumKit.VenueEra
import protocol Catena.ResultProviding
import protocol Catenoid.Fields
import protocol DrumKitService.CorpsEraSpec
import protocol DrumKitService.DivisionRankSpec
import protocol DrumKitService.DivisionSubordinationSpec
import protocol DrumKitService.FeatureRoleSpec
import protocol DrumKitService.VenueEraSpec

extension API: CorpsEraSpec where CorpsEraSpecifiedFields: Fields<CorpsEra.Identified> {
	public typealias CorpsEraList = Results<CorpsEraSpecifiedFields>
}

extension API: VenueEraSpec where VenueEraSpecifiedFields: Fields<VenueEra.Identified> {
	public typealias VenueEraList = Results<VenueEraSpecifiedFields>
}

extension API: DivisionRankSpec where DivisionRankSpecifiedFields: Fields<DivisionRank.Identified> {
	public typealias DivisionRankList = Results<DivisionRankSpecifiedFields>
}

extension API: DivisionSubordinationSpec where DivisionSubordinationSpecifiedFields: Fields<DivisionSubordination.Identified> {
	public typealias DivisionSubordinationList = Results<DivisionSubordinationSpecifiedFields>
}

extension API: FeatureRoleSpec where FeatureRoleSpecifiedFields: Fields<FeatureRole.Identified> {
	public typealias FeatureRoleList = Results<FeatureRoleSpecifiedFields>
}
