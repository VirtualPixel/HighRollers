//
//  DiceStepper.swift
//  HighRollers
//
//  Created by Justin Wells on 12/19/22.
//

import CoreHaptics
import SwiftUI

struct DiceStepper: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var count: Int
    @State private var engine: CHHapticEngine?
    @State private var timer: Timer?
    let range: ClosedRange<Int>
    
    var unit: String {
        count == 1 ? "die" : "dice"
    }
    
    var body: some View {
        HStack {
            Spacer()
            
            Button {
                prepareHaptics()
                subtract()
            } label: {
                Text("-")
                    .stepperButtonStyle()
            }
            
            
            Spacer()
            
            Text("\(count) \(unit)")
                .frame(width: 100)
                .font(.title2.bold())
            
            Spacer()
            
            Button {
                prepareHaptics()
                add()
            } label: {
                Text("+")
                    .stepperButtonStyle()
            }
            
            Spacer()
        }
        .frame(width: 300, height: 60)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(colorScheme == .dark ? .black : .white )
                .shadow(color: colorScheme == .dark ? .white : .gray, radius: 4)
        )
    }
    
    func subtract() {
        guard count > range.lowerBound else {
            failed()
            return
        }
        
        count -= 1
    }
    
    func add() {
        guard count < range.upperBound else {
            failed()
            return
        }
        
        count += 1
    }
    
    func failed() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

            do {
                engine = try CHHapticEngine()
                try engine?.start()
            } catch {
                print("There was an error creating the engine: \(error.localizedDescription)")
            }
    }
}

struct DiceStepper_Previews: PreviewProvider {
    static var previews: some View {
        DiceStepper(count: .constant(4), range: 1...5)
    }
}

struct StepperButton: ViewModifier {
    func body(content: Content) -> some View {
        content
        .font(.system(size: 500))
        .minimumScaleFactor(0.01)
        .font(.title.bold())
        .foregroundColor(.secondary)
        .frame(maxWidth: .infinity)
    }
}

extension View {
    func stepperButtonStyle() -> some View {
        modifier(StepperButton())
    }
}
