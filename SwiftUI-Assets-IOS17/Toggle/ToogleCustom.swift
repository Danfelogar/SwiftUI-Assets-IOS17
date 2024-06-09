//
//  ToogleCustom.swift
//  SwiftUI-Assets-IOS17
//
//  Created by Daniel on 8/06/24.
//

import SwiftUI

struct ToogleCustom: View {
    //State
    @State private var isWifiOn = false
    //View
    var body: some View {
        VStack {
            Form {
                Toggle("Wi-Fi", systemImage: isWifiOn ? "wifi" : "wifi.slash", isOn: $isWifiOn)
                    .tint(.orange)
                    .font(.largeTitle)
                    .contentTransition(.symbolEffect)
                Toggle("Wi-Fi", isOn: $isWifiOn)
                Toggle("Wi-Fi", systemImage: "wifi", isOn: $isWifiOn)
                    .tint(.purple)
                Toggle("Wi-Fi", isOn: $isWifiOn)
                Toggle("Wi-Fi", systemImage: "wifi", isOn: $isWifiOn)
                    .tint(.purple)
                    .toggleStyle(.button)
                    .labelStyle(.iconOnly)
                Toggle("Wi-Fi", isOn: $isWifiOn)
            }//Form
        }//VStack
        .padding()
        
    }
}

#Preview { ToogleCustom() }
