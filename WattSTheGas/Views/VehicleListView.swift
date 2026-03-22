//
//  VehicleListView.swift
//  WattSTheGas
//

import SwiftUI

struct VehicleListView: View {
    var store: VehicleStore
    @State private var editingVehicle: EVVehicle? = nil
    @State private var isAdding = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(store.vehicles) { vehicle in
                    VehicleRow(vehicle: vehicle)
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button(role: .destructive) {
                                store.delete(vehicle)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            Button {
                                editingVehicle = vehicle
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                            .tint(.blue)
                        }
                }
            }
            .navigationTitle("Vehicles")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button { isAdding = true } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(item: $editingVehicle) { vehicle in
                VehicleFormView(store: store, editing: vehicle)
            }
            .sheet(isPresented: $isAdding) {
                VehicleFormView(store: store, editing: nil)
            }
        }
    }
}

private struct VehicleRow: View {
    let vehicle: EVVehicle

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(vehicle.displayName)
                .font(.body)
            Text("\(vehicle.wltpKWhPer100km, format: .number.precision(.fractionLength(1))) kWh/100 km (WLTP)")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 2)
    }
}
