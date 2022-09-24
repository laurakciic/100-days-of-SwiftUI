//
//  CheckoutView.swift
//  10_CupcakeCorner
//
//  Created by Laura on 24.09.2022..
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: SharedOrder
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    @State private var errorMessage = ""
    @State private var showingError = false
    
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
                
                Button("Place order") {
                    Task {
                        await placeOrder()
                    }
                }
                    .padding()
            }
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Thank you", isPresented: $showingConfirmation) {
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }
        
        .alert("Oops", isPresented: $showingError) {
            Button("OK") { }
        } message: {
            Text(errorMessage)
        }
    } 
    
    func placeOrder() async {
        // 1. convert order object into json
        guard let encoded = try? JSONEncoder().encode(order.data) else {
            print("Failed to encode order")
            return
        }
        
        // 2. tel swift how to send data
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")    // info has type of application/json
        request.httpMethod = "POST"                                                 // write post info
        
        // 3. run request and do something with response
        do {
            // upload call
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            // handle result
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.quantity)x \(SharedOrder.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
        } catch {
            errorMessage = "Checkout failed.\n\nMessage: \(error.localizedDescription)"
            showingError = true
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: SharedOrder())
    }
}
