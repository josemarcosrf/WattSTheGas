# AGENTS.md

## Project

WattSTheGas is an iOS calculator: enter an EV's consumption and an ICE car's fuel
consumption, set one price, and it shows what the other price would need to be for
both vehicles to cost the same per 100 km, plus the actual running cost of each at
the entered prices. See `README.md` for feature details and the cost formula.

## Repository structure

```
WattSTheGas/
├── WattSTheGasApp.swift          Entry point
├── ContentView.swift             TabView root (owns VehicleStore)
├── Item.swift                    EVVehicle model + static vehicle database
├── VehicleStore.swift            @Observable mutable vehicle list
├── ViewModel/
│   └── CalculatorViewModel.swift Core calculation logic + price anchor state
└── Views/                        SwiftUI views (calculator, inputs, results, vehicle list/form)
WattSTheGasTests/                 Unit tests
WattSTheGasUITests/               UI tests
```

No third-party dependencies; no package resolution needed.

## Building & testing

Open `WattSTheGas.xcodeproj` in Xcode (26+), select a simulator, press **⌘R** to run
and **⌘U** to run the test suite. There is no CLI build pipeline in this repo.
