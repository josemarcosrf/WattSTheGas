//
//  EVInputSection.swift
//  WattSTheGas
//

import SwiftUI

struct EVInputSection: View {
    @Bindable var vm: CalculatorViewModel
    var store: VehicleStore
    var focusState: FocusState<Bool>.Binding

    var body: some View {
        GroupBox("Electric Vehicle") {
            VStack(alignment: .leading, spacing: 12) {
                Picker("Input Mode", selection: $vm.evInputMode) {
                    ForEach(EVInputMode.allCases) { mode in
                        Text(mode.rawValue).tag(mode)
                    }
                }
                .pickerStyle(.segmented)

                if vm.evInputMode == .picker {
                    Picker("Vehicle", selection: $vm.selectedVehicle) {
                        ForEach(store.vehicles) { vehicle in
                            VStack(alignment: .leading) {
                                Text(vehicle.displayName)
                                Text("\(vehicle.wltpKWhPer100km, format: .number.precision(.fractionLength(1))) kWh/100km (WLTP)")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .tag(vehicle)
                        }
                    }
                    .pickerStyle(.navigationLink)
                    .font(.subheadline)
                } else {
                    HStack {
                        Text("Consumption")
                        Spacer()
                        TextField(
                            "kWh/100km",
                            value: $vm.manualKWhPer100km,
                            format: .number.precision(.fractionLength(1...1))
                        )
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                        .frame(width: 80)
                        .focused(focusState)
                        Text("kWh/100km")
                            .foregroundStyle(.secondary)
                            .font(.caption)
                    }
                }
            }
        }
    }
}
