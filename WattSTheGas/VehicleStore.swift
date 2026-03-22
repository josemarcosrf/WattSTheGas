//
//  VehicleStore.swift
//  WattSTheGas
//

import Observation

@Observable final class VehicleStore {
    var vehicles: [EVVehicle] = EVVehicle.all

    func add(_ vehicle: EVVehicle) {
        vehicles.append(vehicle)
    }

    func update(_ vehicle: EVVehicle) {
        guard let i = vehicles.firstIndex(where: { $0.id == vehicle.id }) else { return }
        vehicles[i] = vehicle
    }

    func delete(_ vehicle: EVVehicle) {
        vehicles.removeAll { $0.id == vehicle.id }
    }
}
