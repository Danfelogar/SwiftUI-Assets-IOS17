//
//  ContentView.swift
//  SwiftUI-Assets-IOS17
//
//  Created by Daniel Felipe on 14/02/24.
//

import SwiftUI

struct SuperPowerScrollViews: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(MockDataCircle.items) { item in
                    Circle()
                        .containerRelativeFrame(.horizontal,
                                                count: verticalSizeClass == .regular ? 2 : 4,
                                                spacing: 16)
                        .foregroundStyle(item.color.gradient)
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1.0 : 0.0)
                                .scaleEffect(x: phase.isIdentity ? 1.0 : 0.3,
                                             y: phase.isIdentity ? 1.0 : 0.3)
                                .offset(y: phase.isIdentity ? 0 : 50)
                        }
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(16, for: .scrollContent)
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview { SuperPowerScrollViews() }



//MARK: - MockData

struct ItemCircle: Identifiable {
    let id = UUID()
    
    let color: Color
}

struct MockDataCircle {
    static var items = [
        ItemCircle(color: .teal),
        ItemCircle(color: .pink),
        ItemCircle(color: .indigo),
        ItemCircle(color: .orange),
        ItemCircle(color: .purple),
        ItemCircle(color: .yellow),
        ItemCircle(color: .green),
        ItemCircle(color: .blue),
        ItemCircle(color: .brown),
        ItemCircle(color: .red)
    ]
}
