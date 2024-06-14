//
//  NavigationStepperViewModel.swift
//  SwiftUI-Assets-IOS17
//
//  Created by Daniel on 13/06/24.
//

import SwiftUI

class NavigationStepperViewModel: NavigationStepperViewModelBase {
    //States
    public var totalSteps: Int8 = 0
    
    @Published public var currentStep: Int8
    @Published public var isCompleted: Bool = false
    @Published public var isTheLastStep: Bool = false
    
    public var isBackStepDisabled: Bool = true
    
    init(totalStepes: Int8, currentStep: Int8, isCompleted:Bool = false) {
        assert(totalStepes >= 2, "Total steps must be at least 2")
        self.totalSteps = totalStepes
        self.currentStep = currentStep
        self.isCompleted = isCompleted
    }
    
    //Functions
    private var isAbleToIncrementCurrentStep: Bool {
        currentStep < totalSteps
    }
    
    public var canBack: Bool {
        currentStep > 1
    }
    
    public func onPrevStep() -> Void {
        withAnimation {
            if canBack {
                let newStep = currentStep - 1
                currentStep = newStep
                isCompleted = false
                isTheLastStep = false
                if newStep == 1 {
                    isBackStepDisabled = true
                }
            }
        }
    }
    
    public func onNextStep() -> Void {
        withAnimation {
            if isAbleToIncrementCurrentStep {
                let newStep = currentStep + 1
                currentStep = newStep
                isCompleted = false
                isBackStepDisabled = false
                if newStep == totalSteps {
                    isTheLastStep = true
                } else {
                    isTheLastStep = false
                }
            } else {
                isCompleted = true
            }
        }
    }
}
