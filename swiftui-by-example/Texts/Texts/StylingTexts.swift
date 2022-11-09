//
//  StylingTexts.swift
//  Texts
//
//  Created by Mehmet Tarhan on 09/11/2022.
//

import SwiftUI

// MARK: - Styling Texts

struct StylingTexts: View {
    let alignments: [TextAlignment] = [.leading, .center, .trailing]
    @State private var alignment = TextAlignment.leading
    
    var body: some View {
        VStack {
            Text("This is an extremely long text string that will never fit even the widest of phones without wrapping")
                .foregroundColor(.red)
                .font(.largeTitle)
                .frame(width: 300)
            
            VStack {
                Picker("Text alignment", selection: $alignment) {
                    ForEach(alignments, id: \.self) { alignment in
                        Text(String(describing: alignment))
                    }
                }
                
                Text("This is an extremely long text string that will never fit even the widest of phones without wrapping")
                    .font(.title)
                    .multilineTextAlignment(alignment)
                    .padding()
                    .background(.yellow)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct StylingTexts_Previews: PreviewProvider {
    static var previews: some View {
        StylingTexts()
    }
}
