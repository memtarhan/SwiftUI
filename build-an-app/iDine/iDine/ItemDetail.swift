//
//  ItemDetail.swift
//  iDine
//
//  Created by Mehmet Tarhan on 08/11/2022.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order

    let item: MenuItem

    var body: some View {
        VStack(spacing: 32) {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 10)
                Text("Shot by \(item.photoCredit)")
                    .padding(5)
                    .background(.black.opacity(0.4))
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))

            Text(item.description)
                .font(.body)
                        
            Button("Order") {
                order.add(item: item)
            }
            .font(.headline)
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .padding(20)
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(item: MenuItem.example)
            .environmentObject(Order())
    }
}
