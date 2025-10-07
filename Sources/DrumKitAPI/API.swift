// Copyright © Fleuronic LLC. All rights reserved.

import DrumKit
import DrumKitService
import Papyrus
import Schemata
import Foundation
import enum Catenary.Request
import struct Catenary.Schema
import struct Caesura.EndpointAPI
import protocol Catenary.Fields
import protocol Catenary.Schematic
import protocol Caesura.API
import protocol Caesura.Endpoint

public struct API<
	Endpoint: Caesura.Endpoint,
	EventSpecifiedFields: EventFields & Fields,
	LocationSpecifiedFields: LocationFields & Fields,
	StateSpecifiedFields: StateFields & Fields,
	CountrySpecifiedFields: CountryFields & Fields,
	CircuitSpecifiedFields: CircuitFields & Fields,
	ShowSpecifiedFields: ShowFields & Fields,
	VenueSpecifiedFields: VenueFields & Fields,
	AddressSpecifiedFields: AddressFields & Fields,
	ZIPCodeSpecifiedFields: ZIPCodeFields & Fields,
	FeatureSpecifiedFields: FeatureFields & Fields,
	EnsembleSpecifiedFields: EnsembleFields & Fields,
	CorpsSpecifiedFields: CorpsFields & Fields,
	DivisionSpecifiedFields: DivisionFields & Fields
>: @unchecked Sendable {
	public let endpoint: Endpoint
}

// MARK: -
public extension API {
	func specifyingEventFields<Fields>(_: Fields.Type) -> API<
		Endpoint,
		Fields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		CorpsSpecifiedFields,
		DivisionSpecifiedFields
	> {
		.init(endpoint: endpoint)
	}

	func specifyingLocationFields<Fields>(_: Fields.Type) -> API<
		Endpoint,
		EventSpecifiedFields,
		Fields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		CorpsSpecifiedFields,
		DivisionSpecifiedFields
	> {
		.init(endpoint: endpoint)
	}

	func specifyingStateFields<Fields>(_: Fields.Type) -> API<
		Endpoint,
		EventSpecifiedFields,
		LocationSpecifiedFields,
		Fields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		CorpsSpecifiedFields,
		DivisionSpecifiedFields
	> {
		.init(endpoint: endpoint)
	}

	func specifyingCountryFields<Fields>(_: Fields.Type) -> API<
		Endpoint,
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		Fields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		CorpsSpecifiedFields,
		DivisionSpecifiedFields
	> {
		.init(endpoint: endpoint)
	}

	func specifyingCircuitFields<Fields>(_: Fields.Type) -> API<
		Endpoint,
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		Fields,
		ShowSpecifiedFields,
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		CorpsSpecifiedFields,
		DivisionSpecifiedFields
	> {
		.init(endpoint: endpoint)
	}

	func specifyingShowFields<Fields>(_: Fields.Type) -> API<
		Endpoint,
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		Fields,
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		CorpsSpecifiedFields,
		DivisionSpecifiedFields
	> {
		.init(endpoint: endpoint)
	}

	func specifyingVenueFields<Fields>(_: Fields.Type) -> API<
		Endpoint,
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		Fields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		CorpsSpecifiedFields,
		DivisionSpecifiedFields
	> {
		.init(endpoint: endpoint)
	}

	func specifyingAddressFields<Fields>(_: Fields.Type) -> API<
		Endpoint,
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		VenueSpecifiedFields,
		Fields,
		ZIPCodeSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		CorpsSpecifiedFields,
		DivisionSpecifiedFields
	> {
		.init(endpoint: endpoint)
	}

	func specifyingZIPCodeFields<Fields>(_: Fields.Type) -> API<
		Endpoint,
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		Fields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		CorpsSpecifiedFields,
		DivisionSpecifiedFields
	> {
		.init(endpoint: endpoint)
	}

	func specifyingFeatureFields<Fields>(_: Fields.Type) -> API<
		Endpoint,
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		Fields,
		EnsembleSpecifiedFields,
		CorpsSpecifiedFields,
		DivisionSpecifiedFields
	> {
		.init(endpoint: endpoint)
	}

	func specifyingEnsembleFields<Fields>(_: Fields.Type) -> API<
		Endpoint,
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		FeatureSpecifiedFields,
		Fields,
		CorpsSpecifiedFields,
		DivisionSpecifiedFields
	> {
		.init(endpoint: endpoint)
	}

	func specifyingCorpsFields<Fields>(_: Fields.Type) -> API<
		Endpoint,
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		Fields,
		DivisionSpecifiedFields
	> {
		.init(endpoint: endpoint)
	}

	func specifyingDivisionFields<Fields>(_: Fields.Type) -> API<
		Endpoint,
		EventSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		CountrySpecifiedFields,
		CircuitSpecifiedFields,
		ShowSpecifiedFields,
		VenueSpecifiedFields,
		AddressSpecifiedFields,
		ZIPCodeSpecifiedFields,
		FeatureSpecifiedFields,
		EnsembleSpecifiedFields,
		CorpsSpecifiedFields,
		Fields
	> {
		.init(endpoint: endpoint)
	}
}

public extension API where Endpoint == EndpointAPI {
	init(apiKey: String) {
		self.init(key: apiKey)
	}
}

public extension API<
	EndpointAPI,
	Event.IDFields,
	Location.IDFields,
	State.IDFields,
	Country.IDFields,
	Circuit.IDFields,
	Show.IDFields,
	Venue.IDFields,
	Address.IDFields,
	ZIPCode.IDFields,
	Feature.IDFields,
	Ensemble.IDFields,
	Corps.IDFields,
	Division.IDFields
> {
	init(apiKey: String) {
		self.init(key: apiKey)
	}
}

// MARK: -
extension API: Caesura.API {
	// MARK: API
	public typealias APIError = Request.Error

	// MARK: Storage
	public typealias StorageError = Self.Error
}

extension API: Schematic {
	// MARK: Schematic
	public static var schema: Schema {
		.init(
			Event.Identified.self,
			Corps.Identified.self,
			Ensemble.Identified.self,
			Circuit.Identified.self,
			Location.Identified.self,
			State.Identified.self,
			Country.Identified.self,
			Show.Identified.self,
			Venue.Identified.self,
			Address.Identified.self,
			ZIPCode.Identified.self,
			Slot.Identified.self,
			Performance.Identified.self,
			Placement.Identified.self,
			Division.Identified.self,
			Feature.Identified.self,
			[Corps.Identified].self,
			[Ensemble.Identified].self,
			[Location.Identified].self,
			[State.Identified].self,
			[Country.Identified].self,
			[Slot.Identified].self,
			[Performance.Identified].self,
			[Placement.Identified].self,
			[Division.Identified].self,
			[Feature.Identified].self
		)
	}
}

// MARK: -
private extension API where Endpoint == EndpointAPI {
	init(key: String) {
		let url = "https://diesel.hasura.app/v1/graphql"
		let provider = Provider(baseURL: url).modifyRequests { request in
			request.addHeader("x-hasura-admin-secret", value: key)
		}

		self.init(endpoint: .init(provider: provider))
	}
}
