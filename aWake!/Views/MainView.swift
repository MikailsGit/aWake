//
//  MainView.swift
//  aWake
//
//  Created by Mikail Yavuz on 23/02/22.
//

import SwiftUI
import AVFoundation


struct MainView: View {
    
    @ObservedObject var dataStorage = DataStorage()
    
    @State var sheet = false
    
    @AppStorage("minute", store: .standard) var minute = ""
    @AppStorage("hour", store: .standard) var hour = ""
    
    
    @State var nowDate: Date = Date()
    
    // let nowDate: Date = Date()
    
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            
            self.nowDate = Date()
        }
    }
    
    
    var body: some View {
        
        
        
        VStack {
            
            Text(countDownString(from: dataStorage.date, until: nowDate))
                .timerStyle()
            
                .onAppear(perform: {
                    let _ = self.timer
                })
            
            Spacer()
            
            Button {
                sheet.toggle()
            } label: {
                
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .foregroundColor(.myYellow)
                    .frame(width: 90, height: 90, alignment: .center)
                    .sheet(isPresented: $sheet) {
                        AddAlarmView(nowDate:self.$nowDate
                                     , dataStorage: DataStorage(), title: String(), minute: String(), hour: String())
                    }
            }
        }
    }
}
