//
//  VoiceView.swift
//  aWake
//
//  Created by Mikail Yavuz on 10/03/22.
//

import Foundation
import SwiftUI

struct VoiceView: View {
    
    
    @AppStorage("start", store : .standard) var start : Bool = false
    
    @EnvironmentObject var swiftUISpeech : SwiftUISpeech
        
//    @State var testText = "Test"
    
    @State var testMic = false
    
    @State var sentences  : [String] = ["I am awake", "I want to wake up"]
    
    var body: some View {
        
        let randomSentemce = sentences.randomElement()!
        
        VStack {
            VStack{
                Text(randomSentemce)
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .padding(50)
                
                Text(swiftUISpeech.outputText)
                    .bold()
                    .font(.title)
                    .multilineTextAlignment(.center)
                
            }.frame(width: 300,height: 400)
            
            VStack {
                
                swiftUISpeech.getButton()
                
            }.padding()
            
            if swiftUISpeech.outputText == randomSentemce {
                Text("")
                    .onAppear {
                        self.testMic = true
                    }
            } else {
                Text("")
            }
            
            if testMic == true {
                Button {
                    deleteNotifications()
                    start.toggle()
                } label: {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 120))
                        .foregroundColor(.myYellow)
                        .frame(width: 200, height: 200, alignment: .center)
                }
            } else {
                Text("")
            }
            
        }.environmentObject(swiftUISpeech)
    }
}

struct VoiceView_Previews: PreviewProvider {
    static var previews: some View {
        VoiceView()
    }
}

