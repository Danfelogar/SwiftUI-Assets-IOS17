//
//  BackwardCompatibility.swift
//  SwiftUI-Assets-IOS17
//
//  Created by Daniel on 5/10/24.
//

import SwiftUI

struct BackwardCompatibility: View {
    
    @State private var didSend = false
    var sendSymbolEffect: some SymbolEffect & DiscreteSymbolEffect {
        if #available(iOS 18.0, *){
            return .wiggle
        } else{
            return .bounce
        }
    }
    
    var body: some View {
        ZStack {
            if #available(iOS 18.0, *) {
                MeshGradient(width: 3, height: 3, points: [
                    .init(0, 0), .init(0.5, 0), .init(1, 0),
                    .init(0, 0.5), .init(0.5, 0.5), .init(1, 0.5),
                    .init(0, 1), .init(0.5, 1), .init(1, 1)
                ], colors: [
                    .red, .purple, .indigo,
                    .orange, .white, .blue,
                    .yellow, .green, .mint
                ])
            } else if #available(iOS 16.0, *){
                Rectangle()
                    .fill(Color.indigo.gradient)
            } else {
                Color.indigo
            }
            
            Button {
                didSend.toggle()
            } label: {
                Label("Send", systemImage: "paperplane.fill")
            }//Btn
            .fontWeight(.semibold)
            .buttonStyle(.borderedProminent)
            .foregroundStyle(.indigo)
            .tint(.white)
            .symbolEffect(sendSymbolEffect, value: didSend)
        }//ZStack
        .ignoresSafeArea()
    }
}

#Preview { BackwardCompatibility() }
