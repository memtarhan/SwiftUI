//
//  SampleView.swift
//  ScrollableTabView
//
//  Created by Mehmet Tarhan on 26.03.2025.
//

import SwiftUI

struct SampleView: View {
    let color: Color
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                ForEach(1 ... 10, id: \.self) { _ in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(color.gradient)
                        .frame(height: 150)
                        .overlay {
                            VStack(alignment: .leading) {
                                Circle()
                                    .fill(.white.opacity(0.25))
                                    .frame(width: 50, height: 50)

                                VStack(alignment: .leading, spacing: 8) {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(.white.opacity(0.25))
                                        .frame(width: 80, height: 8)
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(.white.opacity(0.25))
                                        .frame(width: 80, height: 8)
                                }

                                Spacer(minLength: 0)

                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.white.opacity(0.25))
                                    .frame(width: 80, height: 8)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            .padding(16)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                }
            }
            .padding(16)
        }
        .scrollIndicators(.hidden)
        .scrollClipDisabled()
        .mask {
            Rectangle()
                .padding(.bottom, -100)
        }
    }
}
