//
//  LazyGridView.swift
//  SwiftUI-Assets-IOS17
//
//  Created by Daniel on 8/06/24.
//

import SwiftUI

struct LazyGridView: View {
    //State
    
    //this is the best for all states of phone between portrain and others
    //    let colummns = GridItem(.adaptive(minimum: 60))
    let colummns = Array(repeating: GridItem(.flexible()), count: 4)
    let rows = Array(repeating: GridItem(.fixed(100)), count: 3)
    
    //Body
    var body: some View {
        //        ScrollView(.horizontal) {
        //            LazyHGrid(rows: rows) {
        //                ForEach(MockDataLazyGridColor.colors, id: \.self){
        //                    RoundedRectangle(cornerRadius: 10)
        //                        .fill($0.gradient)
        //                        .frame(width: 100)
        //                }
        //            }// LazyHGrid
        //        }// ScrollView
        ScrollView {
            LazyVGrid(columns: colummns, pinnedViews: .sectionHeaders) {
                Section {
                    ForEach(MockDataLazyGridColor.colors, id: \.self){
                        RoundedRectangle(cornerRadius: 10)
                            .fill($0.gradient)
                            .frame(height: 100)
                    }
                } header: {
                    Text("Favorites")
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                }//Section
                
                Section {
                    ForEach(MockDataLazyGridColor.colors, id: \.self){
                        RoundedRectangle(cornerRadius: 10)
                            .fill($0.gradient)
                            .frame(height: 100)
                    }
                } header: {
                    Text("Don't Like")
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                }//Section
                
            }//LazyVGrid
            .padding()
        }//ScrollView
    }
}

#Preview { LazyGridView() }


struct MockDataLazyGridColor {
    static var colors: [Color] {
        var array: [Color] = []
        for _ in 0..<30 { array.append(Color.random) }
        return array
    }
}
