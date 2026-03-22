//
//  PriceSection.swift
//  WattSTheGas
//

import SwiftUI

struct PriceSection: View {
    @Bindable var vm: CalculatorViewModel
    var focusState: FocusState<Bool>.Binding

    var body: some View {
        GroupBox("Fuel Prices") {
            VStack(spacing: 8) {
                HStack {
                    Text("Electricity")
                    Spacer()
                    TextField(
                        "€/kWh",
                        value: $vm.kWhPrice,
                        format: .number.precision(.fractionLength(2...3))
                    )
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
                    .frame(width: 80)
                    .focused(focusState)
                    .onChange(of: vm.kWhPrice) { vm.priceAnchor = .electricity }
                    Text("€/kWh")
                        .foregroundStyle(.secondary)
                        .font(.caption)
                }

                HStack {
                    Text("Fuel")
                    Spacer()
                    TextField(
                        "€/L",
                        value: $vm.gasPrice,
                        format: .number.precision(.fractionLength(2...3))
                    )
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
                    .frame(width: 80)
                    .focused(focusState)
                    .onChange(of: vm.gasPrice) { vm.priceAnchor = .fuel }
                    Text("€/L")
                        .foregroundStyle(.secondary)
                        .font(.caption)
                }
            }
        }
    }
}
