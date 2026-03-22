//
//  ContentView.swift
//  WattSTheGas
//
//  Created by Jose Marcos RF on 21/3/26.
//

import SwiftUI

struct ContentView: View {
    @State private var store = VehicleStore()

    var body: some View {
        TabView {
            CalculatorView(store: store)
                .tabItem { Label("Calculator", systemImage: "bolt.car.fill") }

            VehicleListView(store: store)
                .tabItem { Label("Vehicles", systemImage: "car.2.fill") }
        }
    }
}

#Preview {
    ContentView()
}
