//
//  AddressView.swift
//  10_CupcakeCorner
//
//  Created by Laura on 24.09.2022..
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: SharedOrder
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Checkout")
                }
            }
            .disabled(order.data.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)     // bc we are  1 lvl deep into UI
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(order: SharedOrder())
        }
    }
}
