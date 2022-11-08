//
//  ItemRow.swift
//  iDine
//
//  Created by Mehmet Tarhan on 08/11/2022.
//

import SwiftUI

struct ItemRow: View {
    let item: MenuItem

    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
                    .font(.footnote)
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
