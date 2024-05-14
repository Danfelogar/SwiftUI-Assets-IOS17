//
//  PieChart.swift
//  SwiftUI-Assets-IOS17
//
//  Created by Daniel Felipe on 13/05/24.
//

import SwiftUI
import Charts

struct PieChart: View {
    var body: some View {
        NavigationStack{
            VStack{
                Chart {
                    ForEach(MockDataChartPie.revenueStreams) { stream in
                        SectorMark(angle: .value("Stream",stream.value),
                                   innerRadius: .ratio(0.618),
//                                   outerRadius: stream.name == "Sponsors" ? 180 : 120,
                                   angularInset: 1.0)
                        .foregroundStyle(stream.color)
//                        .foregroundStyle(by: .value("Name",stream.name))
                        .cornerRadius(6)
//                        .annotation(position: .overlay) {
//                            Text("$\(Int(stream.value))")
//                                .bold()
//                                .foregroundStyle(.white)
//                        }
                    }//ForEach
                }//Chart
                .chartLegend(.hidden)
                .frame(width: 300, height: 300)
            }//VStack
            .padding()
            .navigationTitle("Revenue")
            
            Spacer()
        }//NavigationStack
    }
}


struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        PieChart()
    }
}

struct RevenueStreamChartPie: Identifiable {
    let id = UUID()
    let name: String
    let value: Double
    let color: Color
}

struct MockDataChartPie {
    static var revenueStreams: [RevenueStreamChartPie] = [
        .init(name: "Adsense", value:806, color: .teal),
        .init(name: "Courses", value:17855, color: .pink),
        .init(name: "Sponsors", value:4000, color: .indigo),
        .init(name: "Consulting", value:2500, color: .purple),
    ]
}
