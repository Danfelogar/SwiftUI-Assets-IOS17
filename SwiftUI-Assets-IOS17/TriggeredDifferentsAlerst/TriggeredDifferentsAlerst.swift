//
//  TriggeredDifferentsAlerst.swift
//  SwiftUI-Assets-IOS17
//
//  Created by Daniel on 9/06/24.
//

import SwiftUI

struct TriggeredDifferentsAlerst: View {
    //State
    @State private var isShowingBasicAlert = false
    @State private var isShowingEnterValueAlert = false
    @State private var isShowingLoginAlert = false
    @State private var error: MyAppErrorCustom = .noNetwork
    
    @State private var valueString = ""
    //View
    var body: some View {
        VStack(spacing: 42) {
            Button("Fetch Data") {
                // Network call fails
                isShowingBasicAlert = true
            }
            .alert("No Network", isPresented: $isShowingBasicAlert) {
                Button("Try Again") {
                    //Do try again code
                }
                
                Button("Delete", role: .destructive) {
                    //Do delete code
                }
                
                Button("Cancel", role: .cancel) {  }
            } message: {
                Text("No network detected, Connet to wi-fi or cellular and try again.")
            }//alert
            
            Button("Enter Data") {
                isShowingEnterValueAlert = true
            }//Button
            .alert("Enter Value", isPresented: $isShowingEnterValueAlert) {
                TextField("Value", text: $valueString)
                
                Button("Submit") {
                    //Do Submit code
                }
                
                Button("Cancel", role: .cancel) {
                    //Do Cancel code
                }
            } message: {
                Text("Enter the dollar value of your item.")
            }
            
            Button("Log In") {
                //this part would be dynamic
                error = .noNetwork
                isShowingLoginAlert = true
            }//Button
            .alert(isPresented: $isShowingLoginAlert, error: error) { error in
                //someThings
                if error == .invalidUserName {
                    TextField("Username", text: $valueString)
                    
                    Button("Submit"){
                        
                    }//Button
                    
                    Button("Cancel",role: .cancel){
                        
                    }//Button
                }
            } message: { error in
                Text(error.failureReason)
            }
           
        }//VStack
    }
}

#Preview { TriggeredDifferentsAlerst() }


enum MyAppErrorCustom: LocalizedError {
    case invalidUserName
    case invalidPassword
    case noNetwork
    
    var errorDescription: String? {
        switch self {
        case .invalidUserName:
            "Invalid Username"
        case .invalidPassword:
            "Invalid Password"
        case .noNetwork:
            "No Network Connection"
        }
    }
    
    var failureReason: String {
        switch self {
        case .invalidUserName:
            "The username entered does not exist in our database."
        case .invalidPassword:
            "The password entered for the username is incorrect."
        case .noNetwork:
            "Unable to detect a network connection. Please connect to wi-fi or cellular and try again."
        }
    }
}
