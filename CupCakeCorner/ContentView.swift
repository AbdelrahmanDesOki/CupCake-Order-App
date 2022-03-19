//
//  ContentView.swift
//  CupCakeCorner
//
//  Created by Abdelrahman  Desoki on 17/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var  Order = order()
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("Select your cake type", selection: $Order.type){
                        ForEach(order.types.indices){
                            Text(order.types[$0])
                        }
                    }
//                    .pickerStyle()
                    
                    Stepper("Number of Cakes: \(Order.quantity)", value: $Order.quantity ,  in: 3...25)
                        
                }
                Section{
                    Toggle("ANy Special REquests", isOn: $Order.specialRequestEnabled.animation())
                    
                    if Order.specialRequestEnabled{
                        Toggle("Add extra frosting", isOn: $Order.extraFrosting)
                        Toggle("Add extra Sprinkles", isOn: $Order.addSprinkles)

                    }
                }
                //calling Address view
                Section{
                    NavigationLink{
                        AddressView(Order: Order)
                    }label: {
                        Text("Delivery Details!!")
                    }
                }
            }
            .navigationTitle("CupcaKe Corner")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
