//
//  FixListsDrag&Drop.swift
//  SwiftUI-Assets-IOS17
//
//  Created by Daniel on 1/09/24.
//

import SwiftUI

struct ListsDrag_Drop: View {
    //States
    @State private var episodes: [Episode] = MockDataListsDrag_Drop.episodes
    //View
    var body: some View {
        //        first way
        //        NavigationStack{
        //            List($episodes, editActions: .move){ episode in
        //                HStack(alignment: .top, spacing: 12){
        //                    RoundedRectangle(cornerRadius: 12)
        //                        .frame(width: 80, height: 80)
        //                        .foregroundStyle(episode.color.wrappedValue)
        ////                        .foregroundStyle(episode.color)
        //
        //                    VStack(alignment: .leading) {
        //                        Text("Episode Title")
        //                            .font(.headline)
        //
        //                        Text("Here is the short description for the lastest episode.")
        //                            .font(.subheadline)
        //                            .foregroundStyle(.secondary)
        //                    }//VStack
        //                }//HStack
        //            }//List
        //            .navigationTitle("Episodes")
        //            .onChange(of: episodes) { oldValue, newValue in
        //                var counter = 0
        //                for episode in newValue {
        //                    episode.listOrder = counter
        //                    counter += 1
        //                    print("\(episode.title), listOrder = \(episode.listOrder)")
        //                }
        //                print("------")
        //            }
        //        }//NavigationStack
        //    }
        
        //        second way
        NavigationStack{
            List{
                ForEach(episodes) {episode in
                    HStack(alignment: .top, spacing: 12){
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 80, height: 80)
                            .foregroundStyle(episode.color)
                        
                        VStack(alignment: .leading) {
                            Text("Episode Title")
                                .font(.headline)
                            
                            Text("Here is the short description for the lastest episode.")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }//VStack
                    }//HStack
                }//ForEach
                .onMove(perform: { idxSet, destination in
                    episodes.move(fromOffsets: idxSet, toOffset: destination)
                    
                    var counter = 0
                    for episode in episodes {
                        episode.listOrder = counter
                        counter += 1
                        print("\(episode.title), listOrder = \(episode.listOrder)")
                    }
                    print("------")
                })
                .navigationTitle("Episodes")
            }//List
        }//NavigationStack
    }
}

#Preview { ListsDrag_Drop() }

class Episode: Identifiable, Equatable {
    let id = UUID()
    var title: String
    var color: Color
    var listOrder: Int
    
    init(title: String, color: Color, listOrder:Int) {
        self.title = title
        self.color = color
        self.listOrder = listOrder
    }
    
    static func == (lhs: Episode, rhs: Episode) -> Bool {
        lhs.id == rhs.id
    }
}

struct MockDataListsDrag_Drop {
    static var episodes: [Episode] {
        [
            Episode(title: "Pink Episode", color: .pink, listOrder: 0),
            Episode(title: "Teal Episode", color: .teal, listOrder: 1),
            Episode(title: "Indigo Episode", color: .indigo, listOrder: 2),
            Episode(title: "Orange Episode", color: .orange, listOrder: 3),
            Episode(title: "Green Episode", color: .green, listOrder: 4),
            Episode(title: "Purple Episode", color: .purple, listOrder: 5),
            Episode(title: "Yellow Episode", color: .yellow, listOrder: 6),
            Episode(title: "Mint Episode", color: .mint, listOrder: 7)
        ]
    }
}
