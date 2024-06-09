//
//  StaticGrid.swift
//  SwiftUI-Assets-IOS17
//
//  Created by Daniel on 8/06/24.
//

import SwiftUI

struct StaticGrid: View {
    //state
    @State private var isOn = false
    var body: some View {
        Grid {
            GridRow {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.pink.gradient)
                    .frame(width: 100, height: 100)
                
                VStack {
                    Circle()
                        .foregroundStyle(.secondary)
                        .frame(width: 60, height: 60)
                    
                    Text("Danfelogar")
                }//VStack
                
                VStack {
                    Button("Tap Me") {
                        // whatever
                    }//Button
                    .buttonStyle(.borderedProminent)
                    
                    Toggle("Volumen", isOn: $isOn)
                        .labelsHidden()
                }//VStack
            }//GridRow
            
            Divider()
            
            GridRow {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.teal.gradient)
                    .frame(height: 100)
                    .gridCellColumns(3)
            }//GridRow
            
            GridRow {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.pink.gradient)
                    .frame(width: 100, height: 100)
                
                VStack {
                    Circle()
                        .foregroundStyle(.secondary)
                        .frame(width: 60, height: 60)
                    
                    Text("Danfelogar")
                }//VStack
                
                VStack {
                    Button("Tap Me") {
                        // whatever
                    }//Button
                    .buttonStyle(.borderedProminent)
                    
                    Toggle("Volumen", isOn: $isOn)
                        .labelsHidden()
                }//VStack
            }//GridRow
        }// Grid
        .padding()
    }
}

#Preview { StaticGrid() }
