//
//  AddressView.swift
//  CupCakeCorner
//
//  Created by Abdelrahman  Desoki on 18/03/2022.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var Order: order
    var body: some View {
        Form{
            Section{
                TextField("Name", text: $Order.name)
                TextField("Street Address", text: $Order.streetAddress)
                TextField("City", text: $Order.city)
                TextField("Cip code", text: $Order.Zip)
            }
            
            Section{
                NavigationLink{
                    CheckOutView(Order: Order)
                }label: {
                    Text("Check Out")
                }
            }
            .disabled(Order.ValidationAddress == false )
        }
        .navigationTitle("Delivery Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        AddressView(Order: order())
        }
    }
}
