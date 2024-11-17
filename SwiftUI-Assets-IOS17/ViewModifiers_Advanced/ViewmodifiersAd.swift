//
//  ViewmodifiersAd.swift
//  SwiftUI-Assets-IOS17
//
//  Created by Daniel on 17/11/24.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
    }
}

extension View {
    
    func withDefaultButtonFormatting(backgroundColor: Color = .purple) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }

}

struct ViewmodifiersAd: View {
    var body: some View {
        VStack(spacing: 10){

            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.headline)
                .withDefaultButtonFormatting()
                
            Text("Hello, everyone!")
                .font(.subheadline)
                .modifier(DefaultButtonViewModifier(backgroundColor: .orange))
                
            Text("Hello !!!")
                .font(.title)
                .modifier(DefaultButtonViewModifier(backgroundColor: .pink))
        }//VStack
        .padding()
    }
}

#Preview {
    ViewmodifiersAd()
}
