//
//  ResultsSection.swift
//  WattSTheGas
//

import SwiftUI

struct ResultsSection: View {
    var vm: CalculatorViewModel

    var body: some View {
        if vm.isValid {
            GroupBox("Cost per 100 km") {
                HStack(spacing: 12) {
                    MetricCard(
                        title: "EV",
                        value: vm.costEVPer100km,
                        unit: "€/100km"
                    )
                    MetricCard(
                        title: "ICE",
                        value: vm.costICEPer100km,
                        unit: "€/100km"
                    )
                }
                .padding(.bottom, 8)

                Divider()

                equivalenceRow
                    .padding(.top, 8)
            }
        }
    }

    @ViewBuilder
    private var equivalenceRow: some View {
        switch vm.priceAnchor {
        case .electricity:
            EquivalenceRow(
                label: "To match EV cost, gas would need to be",
                value: vm.equivalentGasPrice,
                unit: "€/L"
            )
        case .fuel:
            EquivalenceRow(
                label: "To match ICE cost, electricity would need to be",
                value: vm.equivalentKWhPrice,
                unit: "€/kWh"
            )
        }
    }
}

private struct MetricCard: View {
    let title: String
    let value: Double
    let unit: String

    var body: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.headline)
            Text(value, format: .number.precision(.fractionLength(2)))
                .font(.title2.bold())
            Text(unit)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))
    }
}

private struct EquivalenceRow: View {
    let label: String
    let value: Double
    let unit: String

    var body: some View {
        HStack {
            Text(label)
                .font(.caption)
                .foregroundStyle(.secondary)
            Spacer()
            Text(value, format: .number.precision(.fractionLength(3)))
                .fontWeight(.semibold)
            Text(unit)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}
