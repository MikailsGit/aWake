//
//  TaskView.swift
//  aWake
//
//  Created by Mikail Yavuz on 09/03/22.
//

import SwiftUI
import Speech


struct TaskView: View {
    
    @State var MicP = false
    
    @AppStorage("start", store: .standard) var start : Bool = false
    
    @ObservedObject var dataStorage = DataStorage()
    
    @State var nowDate: Date = Date()
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.nowDate = Date()
        }
    }
    
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Text(countDownString(from: dataStorage.date, until: nowDate))
                    .timerStyle2()
                
                    .onAppear(perform: {
                        let _ = self.timer
                    })
                
                
                // MARK: This is to have a button to stop the notifications, for a test purpose
                
                //                Button {
                //                    deleteNotifications()
                //                    start.toggle()
                //                } label: {
                //                    Text("STOP")
                //                }
                
                List {
                    if dataStorage.speech == true {
                        
                        NavigationLink(destination: VoiceView().environmentObject(SwiftUISpeech())) {
                            
                            Text("Speech task")
                        }
                    }
                    if dataStorage.qrCode == true {
                        NavigationLink(destination: QRCodeView()) {
                            Text("QRCode task")
                        }
                    }
                    if dataStorage.steps == true {
                        NavigationLink(destination: StepsView()) {
                            Text("Steps task")
                        }
                        
                    }
                }.listStyle(.inset)
            }.onAppear {
                SFSpeechRecognizer.requestAuthorization { authStatus in
                    OperationQueue.main.addOperation {
                        switch authStatus {
                        case .authorized:
                            self.MicP = true
                            
                        case .denied:
                            break
                            
                        case .restricted:
                            break
                            
                        case .notDetermined:
                            break
                            
                        default:
                            break
                        }
                    }
                }
            }
        }
    }
}
