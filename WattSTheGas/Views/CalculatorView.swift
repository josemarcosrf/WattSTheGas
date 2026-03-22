//
//  CalculatorView.swift
//  WattSTheGas
//

import SwiftUI

struct CalculatorView: View {
    var store: VehicleStore
    @State private var vm = CalculatorViewModel()
    @FocusState private var isAnyFieldFocused: Bool

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    EVInputSection(vm: vm, store: store, focusState: $isAnyFieldFocused)
                    ICEInputSection(vm: vm, focusState: $isAnyFieldFocused)
                    PriceSection(vm: vm, focusState: $isAnyFieldFocused)
                    ResultsSection(vm: vm)
                }
                .padding()
            }
            .scrollDismissesKeyboard(.interactively)
            .navigationTitle("WattSTheGas")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") { isAnyFieldFocused = false }
                }
            }
        }
        .onChange(of: store.vehicles) {
            if !store.vehicles.contains(vm.selectedVehicle), let first = store.vehicles.first {
                vm.selectedVehicle = first
            }
        }
    }
}
