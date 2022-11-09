//
//  CheckoutView.swift
//  iDine
//
//  Created by Mehmet Tarhan on 09/11/2022.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order

    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    let tipPercentages = [10, 15, 20, 25, 0]

    @State private var selectedPaymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var selectedTipPercentage = 15

    var body: some View {
        Form {
            Section {
                Picker("Payment method", selection: $selectedPaymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }

                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }

            Section(header: Text("Add a tip?")) {
                Picker("Percentage: ", selection: $selectedTipPercentage) {
                    ForEach(tipPercentages, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }

            Section(header: Text("TOTAL: $100")) {
                Button("Confirm order") {
                }
            }
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
