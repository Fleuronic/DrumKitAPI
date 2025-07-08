// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus
import Schemata
import Foundation
import enum Catenary.Request
import struct DrumKit.Event
import struct DrumKit.Corps
import struct DrumKit.Circuit
import struct DrumKit.Location
import struct DrumKit.State
import struct DrumKit.Country
import struct DrumKit.Show
import struct DrumKit.Venue
import struct DrumKit.Address
import struct DrumKit.ZIPCode
import struct DrumKit.ZIPCode
import struct DrumKit.Performance
import struct DrumKit.Feature
import struct Catenary.Schema
import struct Caesura.EndpointAPI
import protocol Catenary.Fields
import protocol Catenary.Schematic
import protocol Caesura.API
import protocol Caesura.Endpoint
import protocol DrumKitService.EventFields
import protocol DrumKitService.CorpsFields
import protocol DrumKitService.LocationFields
import protocol DrumKitService.StateFields
import protocol DrumKitService.VenueFields
import protocol DrumKitService.ZIPCodeFields

public struct API<
	Endpoint: Caesura.Endpoint,
	EventSpecifiedFields: EventFields & Fields,
	CorpsSpecifiedFields: CorpsFields & Fields,
	LocationSpecifiedFields: LocationFields & Fields,
	StateSpecifiedFields: StateFields & Fields,
	VenueSpecifiedFields: VenueFields & Fields,
	ZIPCodeSpecifiedFields: ZIPCodeFields & Fields
>: @unchecked Sendable {
	public let endpoint: Endpoint
}

// MARK: -
public extension API {
	func specifyingEventFields<Fields>(_: Fields.Type) -> API<
		Endpoint,
		Fields,
		CorpsSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		VenueSpecifiedFields,
		ZIPCodeSpecifiedFields
	> {
		.init(endpoint: endpoint)
	}

	func specifyingCorpsFields<Fields>(_: Fields.Type) -> API<
		Endpoint,
		EventSpecifiedFields,
		Fields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		VenueSpecifiedFields,
		ZIPCodeSpecifiedFields
	> {
		.init(endpoint: endpoint)
	}

	func specifyingLocationFields<Fields>(_: Fields.Type) -> API<
		Endpoint,
		EventSpecifiedFields,
		CorpsSpecifiedFields,
		Fields,
		StateSpecifiedFields,
		VenueSpecifiedFields,
		ZIPCodeSpecifiedFields
	> {
		.init(endpoint: endpoint)
	}

	func specifyingStateFields<Fields>(_: Fields.Type) -> API<
		Endpoint,
		EventSpecifiedFields,
		CorpsSpecifiedFields,
		LocationSpecifiedFields,
		Fields,
		VenueSpecifiedFields,
		ZIPCodeSpecifiedFields
	> {
		.init(endpoint: endpoint)
	}

	func specifyingVenueFields<Fields>(_: Fields.Type) -> API<
		Endpoint,
		EventSpecifiedFields,
		CorpsSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		Fields,
		ZIPCodeSpecifiedFields
	> {
		.init(endpoint: endpoint)
	}

	func specifyingZIPCodeFields<Fields>(_: Fields.Type) -> API<
		Endpoint,
		EventSpecifiedFields,
		CorpsSpecifiedFields,
		LocationSpecifiedFields,
		StateSpecifiedFields,
		VenueSpecifiedFields,
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
	Corps.IDFields,
	Location.IDFields,
	State.IDFields,
	Venue.IDFields,
	ZIPCode.IDFields
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
			Circuit.Identified.self,
			Location.Identified.self,
			State.Identified.self,
			Country.Identified.self,
			Show.Identified.self,
			Venue.Identified.self,
			Address.Identified.self,
			ZIPCode.Identified.self,
			ZIPCode.Identified.self,
			Performance.Identified.self,
			Feature.Identified.self
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
