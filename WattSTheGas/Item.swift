//
//  Item.swift
//  WattSTheGas
//
//  Created by Jose Marcos RF on 21/3/26.
//

import Foundation

struct EVVehicle: Identifiable, Hashable {
    let id: UUID
    let make: String
    let model: String
    let variant: String
    let wltpKWhPer100km: Double

    var displayName: String { "\(make) \(model) \(variant)" }

    static let all: [EVVehicle] = [
        EVVehicle(id: UUID(), make: "Tesla",         model: "Model 3",    variant: "Long Range RWD",    wltpKWhPer100km: 14.3),
        EVVehicle(id: UUID(), make: "Tesla",         model: "Model 3",    variant: "Standard Range",    wltpKWhPer100km: 15.4),
        EVVehicle(id: UUID(), make: "Tesla",         model: "Model Y",    variant: "Long Range AWD",    wltpKWhPer100km: 16.9),
        EVVehicle(id: UUID(), make: "Tesla",         model: "Model Y",    variant: "Standard Range",    wltpKWhPer100km: 15.7),
        EVVehicle(id: UUID(), make: "Volkswagen",    model: "ID.4",       variant: "Pro 77 kWh",        wltpKWhPer100km: 18.3),
        EVVehicle(id: UUID(), make: "Volkswagen",    model: "ID.3",       variant: "Pro 58 kWh",        wltpKWhPer100km: 15.4),
        EVVehicle(id: UUID(), make: "Renault",       model: "Megane E-Tech", variant: "EV60 220hp",     wltpKWhPer100km: 16.1),
        EVVehicle(id: UUID(), make: "BMW",           model: "iX3",        variant: "M Sport",           wltpKWhPer100km: 18.5),
        EVVehicle(id: UUID(), make: "BMW",           model: "i4",         variant: "eDrive40",          wltpKWhPer100km: 16.0),
        EVVehicle(id: UUID(), make: "Hyundai",       model: "IONIQ 6",    variant: "Long Range RWD",    wltpKWhPer100km: 14.3),
        EVVehicle(id: UUID(), make: "Hyundai",       model: "IONIQ 5",    variant: "Long Range AWD",    wltpKWhPer100km: 17.9),
        EVVehicle(id: UUID(), make: "Kia",           model: "EV6",        variant: "Long Range RWD",    wltpKWhPer100km: 14.7),
        EVVehicle(id: UUID(), make: "Kia",           model: "EV9",        variant: "Long Range AWD",    wltpKWhPer100km: 21.4),
        EVVehicle(id: UUID(), make: "Mercedes-Benz", model: "EQA",        variant: "250+",              wltpKWhPer100km: 16.3),
        EVVehicle(id: UUID(), make: "Mercedes-Benz", model: "EQB",        variant: "300 4MATIC",        wltpKWhPer100km: 18.9),
        EVVehicle(id: UUID(), make: "Peugeot",       model: "e-208",      variant: "50 kWh",            wltpKWhPer100km: 14.2),
        EVVehicle(id: UUID(), make: "Audi",          model: "Q4 e-tron",  variant: "40",                wltpKWhPer100km: 17.8),
        EVVehicle(id: UUID(), make: "Skoda",         model: "Enyaq",      variant: "iV 80",             wltpKWhPer100km: 17.0),
    ]
}
