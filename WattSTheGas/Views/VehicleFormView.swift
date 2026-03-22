//
//  VehicleFormView.swift
//  WattSTheGas
//

import SwiftUI

struct VehicleFormView: View {
    var store: VehicleStore
    var editing: EVVehicle?   // nil → add mode

    @Environment(\.dismiss) private var dismiss
    @State private var make        = ""
    @State private var model       = ""
    @State private var variant     = ""
    @State private var consumption = 15.0
    @FocusState private var isFocused: Bool

    private var isEditing:  Bool { editing != nil }
    private var isFormValid: Bool { !make.isEmpty && !model.isEmpty && consumption > 0 }

    var body: some View {
        NavigationStack {
            Form {
                Section("Vehicle") {
                    TextField("Make", text: $make)
                    TextField("Model", text: $model)
                    TextField("Variant (optional)", text: $variant)
                }
                Section("Consumption") {
                    HStack {
                        TextField(
                            "kWh/100 km",
                            value: $consumption,
                            format: .number.precision(.fractionLength(1...1))
                        )
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                        Text("kWh/100 km")
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle(isEditing ? "Edit Vehicle" : "Add Vehicle")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") { save() }
                        .disabled(!isFormValid)
                }
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") { isFocused = false }
                }
            }
        }
        .onAppear {
            if let v = editing {
                make        = v.make
                model       = v.model
                variant     = v.variant
                consumption = v.wltpKWhPer100km
            }
        }
    }

    private func save() {
        let vehicle = EVVehicle(
            id: editing?.id ?? UUID(),
            make: make,
            model: model,
            variant: variant,
            wltpKWhPer100km: consumption
        )
        isEditing ? store.update(vehicle) : store.add(vehicle)
        dismiss()
    }
}
