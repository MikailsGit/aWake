//
//  AddAlarmView.swift
//  aWake
//
//  Created by Mikail Yavuz on 23/02/22.
//

import SwiftUI
import UserNotifications


struct AddAlarmView: View {
    
    @Binding var nowDate: Date
    
    @ObservedObject var dataStorage = DataStorage()
    
    @AppStorage("start", store: .standard) var start : Bool = false
    
    @EnvironmentObject var taskk : TasksData
    
    @State var title : String
    @State var sound : Double = 1
    
    
    @AppStorage("minute", store: .standard) var minute = ""
    @AppStorage("hour", store: .standard) var hour = ""
    
    @Environment(\.dismiss) var dismiss
    
    @State var testLoop = false
    
    @State var testLooop = false
    
    @ViewBuilder
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "pencil.circle")
                    TextField("Alarm name", text: $title)
                    
                }.underlineTextField()
                    .padding(.horizontal, 20)
            }.padding()
        }
        
        VStack(alignment: .center) {
            
            DatePicker("", selection: $dataStorage.date, displayedComponents: .hourAndMinute).datePickerStyle(.wheel).padding(.trailing, 35)
            
                .padding(.vertical, 20)
            
            
            Text("Tasks").foregroundColor(.myYellow)
                .padding(.trailing, 320)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                TestTasksCards()
                
            } .padding(.leading, 7)
                .padding(.vertical, 20)
            
            HStack {
                Image(systemName: "speaker.fill")
                Slider(value: $sound, in: 0...1)
                    .accentColor(.myYellow)
                
                Image(systemName: "speaker.wave.2.fill")
            }.foregroundColor(.myYellow)
                .padding().padding(.top)
            
            Button {
                
                self.nowDate = Date()
                
                deleteNotifications()
                
                self.hour = Calendar.current.component(.day, from: dataStorage.date).formatted()
                self.minute = Calendar.current.component(.minute, from: dataStorage.date).formatted()
                
                let dateValue = Calendar.current
                
                let hour = dateValue.component(.hour, from: dataStorage.date)
                let minute = dateValue.component(.minute, from: dataStorage.date)
                
                self.dataStorage.date = dataStorage.date
                
                let currentMinute = dateValue.component(.minute, from: Date())
                let currentHour = dateValue.component(.hour, from: Date())
                
                let dateConverte = Calendar.current.dateComponents([.day, .hour, .minute], from: dataStorage.date)
                
                start.toggle()
                
                print(dataStorage.complete ? "1" : "2")
                
                notificationRequest(date: dateConverte, title: "aWake", subtitle: title)
                
                if dataStorage.complete == false {
                    DispatchQueue.background(delay: 0.1, completion: {
                        
                        Timer.scheduledTimer(withTimeInterval: 30, repeats: false) {_ in
                            
                            for _ in 0...1 {
                                if currentMinute >= minute && currentHour >= hour {
                                    notificationReepeting(interval: 60, title: "aWake", subtitle: title)
                                }
                            }
                        }
                    })
                }
                
            } label: {
                Text("Set !!")
                    .foregroundColor(.myYellow)
                    .font(.system(size: 30))
                
                
            }.buttonStyle(.bordered)
                .padding(.vertical, 20)
        }
    }
}
