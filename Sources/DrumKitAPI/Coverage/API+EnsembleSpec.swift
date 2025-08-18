import struct DrumKit.Ensemble
import protocol Catena.ResultProviding
import protocol Catenoid.Fields
import protocol DrumKitService.EnsembleSpec

extension API: EnsembleSpec where EnsembleSpecifiedFields: Fields<Ensemble.Identified> {
	public typealias EnsembleFetch = SingleResult<EnsembleSpecifiedFields?>
}
