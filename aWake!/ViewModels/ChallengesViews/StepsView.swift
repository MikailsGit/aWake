//
//  StepsView.swift
//  aWake
//
//  Created by Mikail Yavuz on 09/03/22.
//

import SwiftUI
import CoreMotion

struct StepsView: View {
    
    @AppStorage("start", store: .standard) var start : Bool = false
    
    let pedometer = CMPedometer()
    
    @State var testBoolSteps = false
    
    @State var steps: Int?
    
    var body: some View {
        VStack {
            Text(steps != nil ? "\(steps!) Steps" : "0")
                .foregroundColor(.myYellow)
                .font(.system(size: 60))
                .onAppear{
                    initializePedometer()
                }
            
            //            if steps == 10 || steps > 10 {
            
            if let stepCount = steps {
                if stepCount >= 10 {
                    
                    
                    Text("").onAppear {
                        self.testBoolSteps = true
                    }
                } else {
                    Text("")
                }
            }
            
            if testBoolSteps  == true {
                Button {
                    deleteNotifications()
                    self.steps = 0
                    start.toggle()
                } label: {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 120))
                        .foregroundColor(.myYellow)
                        .frame(width: 200, height: 200, alignment: .center)
                }
            }
        }
        
        .padding(80)
        
        VStack {
            Button {
                start.toggle()
                self.steps = 0
            } label: {
                if start == false {
                    Text("Finish !")
                        .foregroundColor(.myYellow)
                } else {
                    Text("")
                }
            }
            
        }.buttonStyle(.bordered)
    }
    
    var isPedometerAvailable: Bool{
        return CMPedometer.isPedometerEventTrackingAvailable() &&
        CMPedometer.isDistanceAvailable() && CMPedometer.isStepCountingAvailable()
    }
    
    func initializePedometer(){
        if CMPedometer.isStepCountingAvailable() { if isPedometerAvailable {
            pedometer.startUpdates(from: Date()){ (pedData,error) in
                guard let pedData = pedData, error == nil else { return }
                steps = pedData.numberOfSteps.intValue
            }
        }
        }
    }
}

struct StepsView_Previews: PreviewProvider {
    static var previews: some View {
        StepsView()
    }
}
