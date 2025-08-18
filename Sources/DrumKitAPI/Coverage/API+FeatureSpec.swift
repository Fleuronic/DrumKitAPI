

import struct DrumKit.Feature
import protocol Catena.ResultProviding
import protocol Catenoid.Fields
import protocol DrumKitService.FeatureSpec

extension API: FeatureSpec where FeatureSpecifiedFields: Fields<Feature.Identified> {
	public typealias FeatureFetch = SingleResult<FeatureSpecifiedFields?>
}
