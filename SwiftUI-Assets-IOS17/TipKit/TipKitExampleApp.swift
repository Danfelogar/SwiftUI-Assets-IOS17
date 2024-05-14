//
//  TipKitExampleApp.swift
//  SwiftUI-Assets-IOS17
//
//  Created by Daniel Felipe on 13/05/24.
//

import SwiftUI
import TipKit

//need this for run the example
struct TipKitExampleApp: App {
    
    var body: some Scene {
        WindowGroup {
            TipKit()
                .task {
//                    try? Tips.resetDatastore()
                    try? Tips.configure([
//                        .displayFrequency(.inmediate)
                        .datastoreLocation(.applicationDefault)
                    ])
                }
        }
    }
}
