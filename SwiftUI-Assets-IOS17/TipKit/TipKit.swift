//
//  TipKit.swift
//  SwiftUI-Assets-IOS17
//
//  Created by Daniel Felipe on 13/05/24.
//

import SwiftUI
import TipKit

struct TipKit: View {
    
    @State private var colors = MockData.colors
    let addColorTip = AddColorTip()
    let setFavoriteTip = SetFavoriteTip()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                TipView(setFavoriteTip)
                    .tipBackground(.teal.opacity(0.2))
                ForEach(colors, id: \.self) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill($0.gradient)
                        .frame(height: 100)
                        .contextMenu {
                            Button("Favorite", systemImage: "star") {
                                // code to set as favorte
                                Task { await SetFavoriteTip.setFavoriteEvent.donate() }
                            }
                        }
                }//ForEach
            }//ScrollView
            .onAppear{
                Task { await SetFavoriteTip.colorsViewVisitedEvent.donate() }
            }
            .padding()
            .navigationTitle("Colors")
            .toolbar {
                Button {
                    colors.insert(.random, at: 0)
                    addColorTip.invalidate(reason: .actionPerformed)
                } label: {
                    Image(systemName: "plus")
                }
                .popoverTip(addColorTip)
            }
        }//NavigationStack
    }
}

struct TipKit_Previews: PreviewProvider {
    static var previews: some View {
        TipKit()
            .task {
//            try? Tips.resetDatastore()
            try? Tips.configure([
//                        .displayFrequency(.inmediate)
                .datastoreLocation(.applicationDefault)
            ])
        }
    }
}

extension Color {
    static var random: Color {
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}

struct MockData {
    static let colors = [
        Color.random,
        Color.random,
        Color.random,
        Color.random
    ]
}
