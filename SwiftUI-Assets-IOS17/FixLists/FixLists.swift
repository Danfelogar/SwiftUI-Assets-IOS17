//
//  FixLists.swift
//  SwiftUI-Assets-IOS17
//
//  Created by Daniel on 1/09/24.
//

import SwiftUI

struct FixLists: View {
    var body: some View {
        NavigationStack{
            ZStack(alignment: .bottom){
                List{
                    ForEach(0..<20) { _ in
                        episodeCell
                    }
                }//List
                .safeAreaInset(edge: .bottom) {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(.pink.gradient.opacity(0.8))
                        .frame(maxWidth: .infinity, maxHeight: 70)
                        .padding()
                }
            }//ZStack
            .navigationTitle("Episodes")
        }// NavigationStack
    }
    
    var episodeCell: some View {
        HStack(alignment: .top, spacing: 12) {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 80, height: 80)
                .foregroundStyle(.indigo.gradient.opacity(0.5))
            // RoundedRectangel
            
            VStack(alignment: .leading){
                Text("Episode Title")
                    .font(.headline)
                
                Text("Here is the short  description for the latest episode.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }// VStack
        }// HStack
    }
}

#Preview {
    FixLists()
}
