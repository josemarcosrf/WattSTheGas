//
//  WattSTheGasTests.swift
//  WattSTheGasTests
//
//  Created by Jose Marcos RF on 21/3/26.
//

import Testing
@testable import WattSTheGas

struct WattSTheGasTests {

    // equivalentGasPrice = (evKWh × kWhPrice) / iceL
    @Test func equivalentGasPrice_formula() {
        let vm = CalculatorViewModel()
        vm.evInputMode = .manual
        vm.manualKWhPer100km = 15.0
        vm.iceLPer100km = 6.0
        vm.kWhPrice = 0.20

        let expected = (15.0 * 0.20) / 6.0  // 0.5
        #expect(abs(vm.equivalentGasPrice - expected) < 0.0001)
    }

    // equivalentKWhPrice = (iceL × gasPrice) / evKWh
    @Test func equivalentKWhPrice_formula() {
        let vm = CalculatorViewModel()
        vm.evInputMode = .manual
        vm.manualKWhPer100km = 15.0
        vm.iceLPer100km = 6.0
        vm.gasPrice = 1.50

        let expected = (6.0 * 1.50) / 15.0  // 0.6
        #expect(abs(vm.equivalentKWhPrice - expected) < 0.0001)
    }

    // isValid guard: zero EV consumption returns 0 equivalents without crash
    @Test func isValid_zeroConsumptionReturnsZero() {
        let vm = CalculatorViewModel()
        vm.evInputMode = .manual
        vm.manualKWhPer100km = 0.0
        vm.iceLPer100km = 6.0

        #expect(vm.isValid == false)
        #expect(vm.equivalentGasPrice == 0)
        #expect(vm.equivalentKWhPrice == 0)
    }

    // priceAnchor defaults to .electricity
    @Test func priceAnchor_defaultsToElectricity() {
        let vm = CalculatorViewModel()
        #expect(vm.priceAnchor == .electricity)
    }

    // Costs are independent — changing one price does not affect the other
    @Test func prices_areIndependent() {
        let vm = CalculatorViewModel()
        vm.evInputMode = .manual
        vm.manualKWhPer100km = 15.0
        vm.iceLPer100km = 6.0
        vm.kWhPrice = 0.20
        vm.gasPrice = 1.60

        vm.kWhPrice = 0.30   // change only electricity price
        #expect(vm.gasPrice == 1.60)  // fuel price must remain unchanged
    }
}
