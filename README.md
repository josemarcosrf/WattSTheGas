# WattSTheGas

An iOS calculator that answers the question every EV-curious driver asks: **at today's electricity and fuel prices, which car actually costs less to run?**

Enter your EV's consumption and your ICE car's fuel consumption, set one price, and instantly see what the other would need to be for both vehicles to cost the same per 100 km — plus the actual running cost of each at the prices you entered.

---

## Features

- **Bidirectional price equivalence** — set the electricity price and see the break-even fuel price, or set the fuel price and see the break-even kWh price
- **EV vehicle database** — 18 real-world vehicles with official WLTP consumption figures, or enter your own manually
- **Vehicle manager** — add, edit, and delete vehicles; swipe left on any row to reveal edit and delete actions
- **Cost cards** — side-by-side €/100 km cost for both vehicles at the entered prices

---

## Requirements

| | |
|---|---|
| Platform | iOS 26.2+ |
| Xcode | 26+ |
| Swift | 5.0 |

No third-party dependencies.

---

## Building

1. Clone the repo
2. Open `WattSTheGas.xcodeproj` in Xcode
3. Select a simulator or device and press **⌘R**

No package resolution or setup steps needed.

---

## Project Structure

```
WattSTheGas/
├── WattSTheGasApp.swift          Entry point
├── ContentView.swift             TabView root (owns VehicleStore)
├── Item.swift                    EVVehicle model + 18-vehicle static database
├── VehicleStore.swift            @Observable mutable vehicle list
├── ViewModel/
│   └── CalculatorViewModel.swift Core calculation logic + price anchor state
└── Views/
    ├── CalculatorView.swift      Calculator tab
    ├── EVInputSection.swift      EV vehicle picker / manual consumption input
    ├── ICEInputSection.swift     ICE fuel consumption input
    ├── PriceSection.swift        Electricity and fuel price fields
    ├── ResultsSection.swift      Cost cards + break-even equivalence row
    ├── VehicleListView.swift     Vehicle management list
    └── VehicleFormView.swift     Add / edit vehicle sheet
```

---

## The Formula

```
EV cost/100km  =  kWh/100km  ×  €/kWh
ICE cost/100km =  L/100km    ×  €/L

Break-even fuel price   = (kWh/100km × €/kWh) / L/100km
Break-even kWh price    = (L/100km   × €/L)   / kWh/100km
```

The **price anchor** determines which equivalence is shown: if you last edited the electricity price, the card shows the break-even fuel price, and vice versa.
