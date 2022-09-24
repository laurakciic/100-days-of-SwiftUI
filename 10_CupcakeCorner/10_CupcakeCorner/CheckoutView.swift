//
//  CheckoutView.swift
//  10_CupcakeCorner
//
//  Created by Laura on 24.09.2022..
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)     // whole async img, bc it will reserve enough space for the img
            
                Text("Your total is \(order.cost, format: .currency(code: "USD"))").font(.title)
                
                Button("Place order", action: {  })
                    .padding()
            }
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
