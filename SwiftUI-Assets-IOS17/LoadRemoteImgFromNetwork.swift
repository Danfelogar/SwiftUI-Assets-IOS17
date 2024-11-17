//
//  LoadRemoteImgFromNetwork.swift
//  SwiftUI-Assets-IOS17
//
//  Created by Daniel Felipe on 15/02/24.
//

import SwiftUI

extension Image {
    func imgModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imgModifier()
            .frame(maxWidth: 128)
            .foregroundStyle(.purple, .yellow)
            .opacity(0.5)
    }
}

struct LoadRemoteImgFromNetwork: View {
    
    private let imgURL: String = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        //MARK: - 1. BASIC
        //AsyncImage(url: URL(string: imgURL))
        //MARK: - 2. SCALE
        //AsyncImage(url: URL(string: imgURL), scale: 3.0)
        //MARK: - 3. PLACEHOLDER
//        AsyncImage(url: URL(string: imgURL)) { image in
//            image
//                .imgModifier()
//        } placeholder: {
//            Image(systemName: "photo.circle.fill")
//                .iconModifier()
//                
//        }.padding(40)
        //MARK: - 4. PHASE
//        AsyncImage(url: URL(string:  imgURL)){ phase in
//            //SUCCESS: The img successfuly loaded.
//            //FAILURE: The img failed to load with an error.
//            //EMPTY: No IMAGE is loaded.
//            
//            if let img = phase.image {
//                img.imgModifier()
//            } else if phase.error != nil {
//                Image(systemName: "ant.circle.fill").iconModifier()
//            } else {
//                Image(systemName: "photo.circle.fill").iconModifier()
//            }
//        }
//        .padding(40)
        //MARK: - 5. ANIMATION
        AsyncImage(url: URL(string:  imgURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            switch phase {
            case.success(let img):
                img.imgModifier()
//                    .transition(.move(edge: .bottom))
//                    .transition(.slide)
                    .transition(.scale)
            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifier()
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                Image(systemName: "photo.circle.fill").iconModifier()
            }
        }
        .padding(40)
    }
}

#Preview { LoadRemoteImgFromNetwork() }
