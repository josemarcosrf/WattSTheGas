//
//  ICEInputSection.swift
//  WattSTheGas
//

import SwiftUI

struct ICEInputSection: View {
    @Bindable var vm: CalculatorViewModel
    var focusState: FocusState<Bool>.Binding

    var body: some View {
        GroupBox("Combustion Engine") {
            HStack {
                Text("Consumption")
                Spacer()
                TextField(
                    "L/100km",
                    value: $vm.iceLPer100km,
                    format: .number.precision(.fractionLength(1...1))
                )
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.trailing)
                .frame(width: 80)
                .focused(focusState)
                .onChange(of: vm.iceLPer100km) {
                    if vm.iceLPer100km < 0.1 { vm.iceLPer100km = 0.1 }
                }
                Text("L/100km")
                    .foregroundStyle(.secondary)
                    .font(.caption)
            }
        }
    }
}
