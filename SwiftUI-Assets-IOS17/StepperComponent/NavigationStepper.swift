//
//  NavigationStepper.swift
//  SwiftUI-Assets-IOS17
//
//  Created by Daniel on 12/06/24.
//

import SwiftUI

protocol NavigationStepperVariables {
    var totalSteps: Int8 { get }
    var currentStep: Int8 { get set }
    var isCompleted: Bool { get set }
}

protocol NavigationStepperMethods {
    func onPrevStep() -> Void
    func onNextStep() -> Void
}


protocol NavigationStepperViewModelBase: ObservableObject, NavigationStepperVariables, NavigationStepperMethods {}

protocol NavigationStepperBase: NavigationStepperVariables {
    func incrementByStep() -> Double
    func progress() -> Double
    func isFocusedStep( _ index: Int) -> Bool
}

struct NavigationStepper: View, NavigationStepperBase {
    //states
    public var totalSteps: Int8
    
    @Binding public var currentStep: Int8
    @Binding public var isCompleted: Bool
    
    //Functions
    internal func incrementByStep() -> Double {
        1.0 / Double(totalSteps - 1)
    }
    
    internal func progress() -> Double {
        Double(currentStep - 1) * incrementByStep()
    }
    
    internal func isFocusedStep(_ index:Int) -> Bool {
        currentStep > index
    }
    
    //View
    var body: some View {
        VStack {
            ProgressView(value: progress())
                .progressViewStyle(NavigationStepperProgressViewStyle(isCompleted: $isCompleted))
                .tint(Color.accentColor)
                .animation(.interpolatingSpring(), value: progress())
            HStack{
                ForEach(0 ..< totalSteps, id: \.self){ index in
                    Circle()
                        .foregroundStyle(isCompleted ? Color.green : isFocusedStep(Int(index)) ? Color.accentColor : Color.pink)
                        .animation(.spring(), value: isFocusedStep(Int(index)))
                        .overlay {
                            Circle()
                                .stroke(Color(UIColor.systemBackground), style: StrokeStyle(lineWidth: isFocusedStep(Int(index)) ? 0 : 5))
                        }
                        .frame(height: 20)
                    
                    if index != totalSteps - 1 {
                        Spacer()
                    }
                }//ForEach
            }//HStack
        }//VStack
    }
}

struct NavigationStepperProgressViewStyle: ProgressViewStyle {
    //States
    @Binding var isCompleted: Bool
    
    //Functions
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { geometry in
            let parentWidth = geometry.size.width
            ZStack(alignment: .leading) {
                //Background track
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.pink)
                    .frame(height: 5)
                
                //Progress bar
                RoundedRectangle(cornerRadius: 5)
                    .fill(isCompleted ? Color.green : Color.accentColor)
                    .frame(width: (CGFloat(configuration.fractionCompleted ?? 0) * parentWidth), height: 5)
            }//ZStack
        }// GeometryRender
        .frame(height: 5)
    }
}

#Preview {
    NavigationStepper(totalSteps: 8, currentStep: .constant(2), isCompleted: .constant(false))
        .padding()
}
