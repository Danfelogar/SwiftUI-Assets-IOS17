//
//  GroupBox.swift
//  SwiftUI-Assets-IOS17
//
//  Created by Daniel on 9/06/24.
//

import SwiftUI

struct GroupBoxContentView: View {
    //state
    //view
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.pink.gradient.opacity(0.8))
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                GroupBox("My Content") {
                    Text("This is my groupbox. Isn't it cool. It's like a card view. Awasome!")
                }//GroupBox
                .frame(width: 240)
                .groupBoxStyle(.music)
                
                GroupBox {
                    GroupBox {
                        MusicPlayerView()
                    }//GroupBox
                    
                } label: {
                    Label("Now Playing", systemImage: "music.note")
                }//GroupBox
                .groupBoxStyle(.music)
            }//VStack
            .padding()
        }//ZStack
    }
}

#Preview { GroupBoxContentView() }

struct MusicGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            
            configuration.label
                .bold()
                .fontDesign(.monospaced)
                .foregroundStyle(.pink)
            configuration.content
        }//VStack
        .padding()
        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))
    }
}

extension GroupBoxStyle where Self == MusicGroupBoxStyle {
    static var music: MusicGroupBoxStyle { .init() }
}

struct MusicPlayerView: View {
    //State
    //View
    var body: some View {
        VStack{
            HStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.secondary)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Cool Song Title")
                        .font(.headline.bold())
                    
                    Text("Artis Name")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }//VStack
                
                Spacer()
            }//HStack
            .padding(.bottom, 8)
            
            ProgressView(value: 0.4, total: 1)
                .tint(.secondary)
                .padding(.bottom, 20)
            
            HStack(spacing: 30){
                Image(systemName: "backward.fill")
                Image(systemName: "pause.fill")
                Image(systemName: "forward.fill")
            }//HStack
            .foregroundStyle(.secondary)
            .font(.title)
        }//VStack
    }
}
