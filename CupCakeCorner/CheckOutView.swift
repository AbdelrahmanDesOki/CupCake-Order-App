//
//  CheckOutView.swift
//  CupCakeCorner
//
//  Created by Abdelrahman  Desoki on 18/03/2022.
//

import SwiftUI

struct CheckOutView: View {
    @ObservedObject var Order: order
    
    @State private var confirmationMessage  = ""
    @State private var showingConfirmation = false
    
    private let ErrorMessage = " OOPs, SOmething went wrong with the Internet Connection !"
    @State private var ShowingErrorMessage = false

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
                .frame(height: 233)

                Text("Your total is \(Order.cost, format: .currency(code: "USD"))")
                    .font(.title)

                Button("Place Order"){
                    Task{
                        await placeOrder()
                    }
                    
                }
                    .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Thank you"  , isPresented: $showingConfirmation){
            Button ("OK"){ }
        } message: {
            Text(confirmationMessage)
        }
        
        .alert(" Oo0oPS"  , isPresented: $ShowingErrorMessage){
            Button ("OK"){ }
        } message: {
            Text(ErrorMessage)
        }
    }
    func placeOrder() async{
        
        guard let encoded = try? JSONEncoder().encode(Order) else {
            print("Failed to eNcode data !")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            // handle the result
            let decodedOrder  = try JSONDecoder().decode( order.self, from: data)
            confirmationMessage = " Your order for \(decodedOrder.quantity) x  \(order.types[decodedOrder.type].lowercased()) Cupcakes is on its way !! "
            showingConfirmation = true
        } catch {
            print("Something Went WRONG Sadly ::(")
            ShowingErrorMessage = true
        }
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView(Order: order())
    }
}
