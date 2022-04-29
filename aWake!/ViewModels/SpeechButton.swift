//
//  SpeechButton.swift
//  aWake
//
//  Created by Mikail Yavuz on 10/03/22.
//

import Foundation
import Speech
import SwiftUI

struct SpeechButton: View {
    
    @State var isPressed : Bool = false
    @State var actionPop : Bool = false
    @EnvironmentObject var swiftUISpeech : SwiftUISpeech
    
    var body: some View {
        
        Button(action:{
            if (self.swiftUISpeech.getSpeechStatus() == "Denied") {
                self.actionPop.toggle()
            } else {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.3)) {
                    self.swiftUISpeech.isRecording.toggle()}
                self.swiftUISpeech.isRecording ? self.swiftUISpeech.startRecording() : self.swiftUISpeech.stopRecording()
            }
        }) {
            Image(systemName: "waveform")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
                .background(swiftUISpeech.isRecording ? Circle().foregroundColor(.red).frame(width: 85, height: 85) : Circle().foregroundColor(.blue).frame(width: 70, height: 70))
        } .actionSheet(isPresented: $actionPop){
            ActionSheet(title: Text("ERROR: - 1"), message: Text("Access Denied by User"), buttons: [ActionSheet.Button.destructive(Text("Reinstall the Appp"))])
        }
    }
}
