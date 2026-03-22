//
//  CalculatorViewModel.swift
//  WattSTheGas
//

import Foundation
import Observation

enum EVInputMode: String, CaseIterable, Identifiable {
    case picker = "Pick a vehicle"
    case manual = "Enter manually"

    var id: String { rawValue }
}

enum PriceAnchor: Equatable {
    case electricity
    case fuel
}

@Observable final class CalculatorViewModel {
    // EV inputs
    var evInputMode: EVInputMode = .picker
    var selectedVehicle: EVVehicle = EVVehicle.all[0]
    var manualKWhPer100km: Double = 15.0

    // ICE inputs
    var iceLPer100km: Double = 6.0

    // Independent price inputs
    var kWhPrice: Double = 0.20
    var gasPrice: Double = 1.60

    // Which price was last set by the user
    var priceAnchor: PriceAnchor = .electricity

    var effectiveKWhPer100km: Double {
        evInputMode == .picker ? selectedVehicle.wltpKWhPer100km : manualKWhPer100km
    }

    var costEVPer100km: Double  { effectiveKWhPer100km * kWhPrice }
    var costICEPer100km: Double { iceLPer100km * gasPrice }

    var isValid: Bool { effectiveKWhPer100km > 0 && iceLPer100km > 0 }

    // What gas price would make ICE equivalent to EV at the entered kWh price
    var equivalentGasPrice: Double {
        guard isValid else { return 0 }
        return (effectiveKWhPer100km * kWhPrice) / iceLPer100km
    }

    // What kWh price would make EV equivalent to ICE at the entered gas price
    var equivalentKWhPrice: Double {
        guard isValid else { return 0 }
        return (iceLPer100km * gasPrice) / effectiveKWhPer100km
    }
}
