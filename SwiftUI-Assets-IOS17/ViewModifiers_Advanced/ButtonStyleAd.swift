//
//  ButtonStyleAd.swift
//  SwiftUI-Assets-IOS17
//
//  Created by Daniel on 17/11/24.
//

import SwiftUI

struct ButtonPressableStyleAd: ButtonStyle {
    
    let scaledAmount: CGFloat
    
    init(scaledAmount: CGFloat = 0.9) {
        self.scaledAmount = scaledAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
//            .brightness(configuration.isPressed ? 0.05 : 0)
            .opacity(configuration.isPressed ? 0.9 : 10)
    }
}

extension View {
    
    func withPressableStyle(sclaedAmt scaledAmount: CGFloat = 0.9) -> some View {
        self.buttonStyle(ButtonPressableStyleAd(scaledAmount: scaledAmount))
    }
}

struct ButtonStyleAd: View {
    var body: some View {
        VStack{
            Button(action: {
                
            }, label: {
                Text("Click Me!!!! :3")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0.0, y: 10)
            })//Button
            .withPressableStyle()
//            .buttonStyle(ButtonPressableStyleAd())
        }//Stack
        .padding(40)
    }
}

#Preview {
    ButtonStyleAd()
}
