//
//  NSExample.swift
//  SwiftUI-Assets-IOS17
//
//  Created by Daniel on 13/06/24.
//

import SwiftUI

struct NSExample: View {
    //States
    @StateObject private var NSViewModel = NavigationStepperViewModel(totalStepes: 3, currentStep: 1)
    
    private var nextButtonText: String {
        NSViewModel.isTheLastStep ? "Mark as complete" : "Next"
    }
    
    //View
    var body: some View {
        VStack {
            NavigationStepper(totalSteps: NSViewModel.totalSteps, currentStep: $NSViewModel.currentStep, isCompleted: $NSViewModel.isCompleted)
            
            switch NSViewModel.currentStep {
                //            case 1:
                //                StepOneView()
                //                    .transition(.move(edge: .trailing).combined(with: .scale(scale: 0.85)))
                //            case 2:
                //                StepTwoView()
                //                    .transition(.move(edge: .trailing).combined(with: .scale(scale: 0.85)))
                //            case 3:
                //                StepThreeView()
                //                    .transition(.move(edge: .trailing).combined(with: .scale(scale: 0.85)))
            default:
                Text("Unknow Step")
            }//Switch
            Spacer()
            HStack {
                Button(action: {
                    NSViewModel.onPrevStep()
                }, label: {
                    HStack {
                        Spacer()
                        Text("Previous")
                            .bold()
                        Spacer()
                    }//HStack
                })//Btn
                .padding()
                .buttonStyle(BorderedButtonStyle())
                .disabled(NSViewModel.isBackStepDisabled)
                
                Button(action: {
                    NSViewModel.onNextStep()
                }, label: {
                    HStack {
                        Spacer()
                        Text(NSViewModel.isTheLastStep ? "Complete": "Next")
                            .bold()
                        Spacer()
                    }//HStack
                })//Btn
                .padding()
                .buttonStyle(BorderedButtonStyle())
                .disabled(NSViewModel.isBackStepDisabled)
            }//HStack
        }//VStack
    }
}

#Preview {
    NSExample()
}
